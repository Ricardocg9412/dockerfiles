#!/usr/bin/env python
from setuptools import setup, find_packages

setup(
    name='wunderpy-cli',
    version='0.0.1',
    author='AJ Bowen',
    license='MIT',
    author_email='aj@soulshake.net',
    packages=find_packages(),
    description='Wunderlist CLI',
    long_description=open('README.rst').read(),
    url='https://github.com/soulshake/wunderpy-cli',
    keywords='wunderlist cli',
    install_requires=['click==3.3',
                      'arrow==0.5.4',
                      'requests==2.7.0',
                      'tabulate==0.7.5'],
    entry_points="""\
[console_scripts]
wunderpy-cli = wunderpycli.__main__:main
""",
    )
