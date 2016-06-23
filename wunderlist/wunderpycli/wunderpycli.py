#!/usr/bin/env python
import os
import click
import json
import requests
from requests.auth import HTTPDigestAuth
from tabulate import tabulate
from pprint import pprint


CONTEXT_SETTINGS = dict(
    help_option_names=['-h', '--help'],
    token_normalize_func=lambda x: x.lower()
    )


class RestAPI:
    def __init__(self, headers={}):
        pass

    def get(self, url, params={}):
        """Send a GET request."""
        click.secho("getting: {}... "
                    .format(url), fg='blue')

        return requests.get(url,
                           headers=self.headers,
                           params=params,
                           auth=HTTPDigestAuth(self.user, self.password))

    def post(self, url, params={}, files=[]):
        """Send a POST request."""
        click.secho("posting: {} ".format(url), fg='blue')

        req = requests.request('post',
                               url,
                               data=params,
                               headers=self.headers)
        return req


class CloudAppAPI(RestAPI):

    def __init__(self):
        self.base_url = "http://my.cl.ly/v3"
        self.content_url = "http://cl.ly"
        self.remote_url = "http://f.cl.ly/items"

        self.check_env()
        self.user = os.environ.get('CLOUDAPP_USER')
        self.password = os.environ.get('CLOUDAPP_PASS')

        self.headers = {
            "Accept": "application/json"
            }

        RestAPI.__init__(self, self.headers)

    def check_env(self):
        print("checking envvars")
        if 'CLOUDAPP_USER' not in os.environ or 'CLOUDAPP_PASS' not in os.environ:
            click.secho("No CLOUDAPP_USER and/or CLOUDAPP_PASS envvar found. ", fg='red')
            click.secho(msg)
            exit()

    def items(self):
        segment = "/items"
        url = self.base_url + segment
        items = self.get(url)
        return items

    def account(self):
        url = "http://my.cl.ly/account"
        response = self.get(url)
        return response

    def upload_item(self, filename, name=None):
        # name    Name of file
        # file_size   File size in bytes (optional)
        """
      "max_upload_size":   262144000,
      "url":               "http://f.cl.ly",
      "params": {
        "AWSAccessKeyId":          "AKIAIDPUZISHSBEOFS6Q",
        "key":                     "items/qL/${filename}",
        "acl":                     "public-read",
        "success_action_redirect": "http://my.cl.ly/items/s3",
        "signature":               "2vRWmaSy46WGs0MDUdLHAqjSL8k=",
        "policy":                  "eyJ..."
        """
        #url = "http://my.cl.ly/v3"
        print("----------- r1 -----------")
        url = "http://my.cl.ly/items/new"
        r1 = self.get(url)
        pprint(r1.__dict__)
        url = json.loads(r1.content)['url']

        # Each item in params becomes a separate parameter we'll need to post to url.
        content = json.loads(r1.content)
        url = content['url']
        params = content['params']

        # Send the file to be uploaded as the parameter named file.
        print("----------- r2 -----------")
        r2 = self.post(url, params=params, files={"file": open(filename, 'rb')})
        #r2 = self.post(url, params=params, files=[open(filename, 'rb')])
        #r2 = self.post(url, params=params, files=filename)
        # r2 = self.post(url, params=params, files=[open(filename, 'r')])
        pprint(r2.__dict__)
        url = r2.url

        # Get redirect URL
        url = r2.url
        print("----------- r3 -----------")
        r3 = self.get(url, params=params)
        pprint(r3.__dict__)
        r4 = self.get(r3.url)
        pprint(r4.__dict__)
        import ipdb; ipdb.set_trace()

        return r4

class RequestError(Exception):
    pass

@click.group(context_settings=CONTEXT_SETTINGS)
def cli():
    pass

@cli.command()
def account():
    response = CLOUD.account()
    content = json.loads(response.content)
    print(content)

@cli.command()
@click.argument("filename")
def upload(filename):
    CLOUD.upload_item(filename)

@cli.command()
def files():
    print("Here are your files:")
    response = CLOUD.items()
    content = json.loads(response.content)
    data = content['data']
    headers = ["view_counter", "created_at", "item_type", "name"]
    rows = []
    for item in data:
        rows.append([item[key] for key in headers])
    headers[0] = "views"
    headers[2] = "type"
    
    print(tabulate(rows, headers))

CLOUD = CloudAppAPI()

if __name__ == '__main__':
    cli(obj={})
