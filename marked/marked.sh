#!/bin/bash

echo "
<!DOCTYPE html>
<html>
    <head>
        <title>soulshake.net</title>
        <meta charset="utf8" />
        <link rel="stylesheet" type="text/css" href="default.css" />
        <meta name="HandheldFriendly" content="true" />
        <meta name="viewport" content="width=device-width, height=device-height, user-scalable=no" />
        <script src="index.js"></script>
    </head>
    <body>
    "

docker run -ti --rm \
    --name marked \
    -v `pwd`:/src \
    soulshake/marked /src/${1}

echo "</body>"
