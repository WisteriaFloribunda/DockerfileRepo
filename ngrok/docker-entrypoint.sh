#! /bin/sh

if [ ! -e '/check' ]; then
    touch /check
    echo "Starting ngrok..."
    ./ngrok --config ngrok.yml config add-authtoken $token
    echo "region: jp" >> ngrok.yml
    echo "web_addr: 0.0.0.0:4040" >> ngrok.yml
    sleep 10
fi

exec "$@"