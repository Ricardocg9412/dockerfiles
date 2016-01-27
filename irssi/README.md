# Irssi in a container

## How to use this?

Drop your OpenVPN configuration file in this directory.

Let's pretend that it's called `hacktheplanet.ovpn`.

Then all you have to do is to run:

```
docker-compose run vpn hacktheplanet.ovpn
```


### I'm using extra files (certificates, keys...)

Just drop them in this directory too. As long as your configuration file references them, you're fine.

(e.g. if you have a `gibson.crt` file you can have `cert gibson.crt` in your configuration file.)


### I'm using a password

That's OK; you will be prompted for it (as long as your OpenVPN configuration correctly specifies `auth-user-pass`).


### I'm not using a password

In that case, you *might* want to use `docker-compose run -d vpn hacktheplanet.ovpn` to start the container in the background (but you can leave it in the foreground if you prefer, that's OK too).


### My VPN server sends me routes and stuff

We got you covered: routes will be added to your machine, because the Compose file specifies `net: host` so the container runs within the hosts namespace.

The container also runs with the `NET_ADMIN` capability so that it is allowed to manipulate routes (it needs it to configure the VPN interface anyway).


### My VPN server sends me DNS configuration (servers and/or search)

In that case, you need the two following lines in your OpenVPN configuration:

```
script-security 2
up update-resolv-conf
```

This will update `/etc/resolv.conf` in the container, and the Compose file makes it a bind-mount to the host's `/etc/resolv.conf`, so you're covered too.


### When I disconnect from the VPN, DNS is broken

Yes, sorry. The lazy bums who crafted this container didn't bother to restore your old DNS settings.

In most systems, you can just run `resolvconf -u` to restore your settings.


### When I suspend/restore or switch to a different WiFi, DNS breaks

This is probably because of interactions between `resolvconf` and the VPN's DNS handling. Sorry.

Your best bet (if that happens) is to restart the VPN container.

That being said, since the VPN will most likely reconnect when you restore or switch to a different network, it should reinstate its DNS settings.


## Why?

Because we're the containerati and we like when things are [neatly arranged in their boxes](https://twitter.com/zooeypeng/status/613053137050439681).

