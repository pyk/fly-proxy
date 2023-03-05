#!/bin/sh

# flyctl proxy is not listening to 0.0.0.0 and we cannot set the host
# So we need socat in order to forward :8000 to $FLY_PORT
socat tcp-listen:8000,reuseaddr,fork tcp:localhost:$FLY_PORT &

echo "Forwarding :8000 to localhost:$FLY_PORT"

# Run the proxy
flyctl proxy -t $FLY_API_TOKEN -a $FLY_APP $FLY_PORT