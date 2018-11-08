# Optune Servo with Spinnaker (adjust) and Wavefront (measure) drivers

## Build servo container and push to docker registry
```
make container push
```

This will build an image named `opsani/servo-spinnaker-wavefront` and push it to Docker Hub.
If you want to build the container under a different name and/or push to private registry:
```
IMG_NAME=my-registry.com/opsani/servo-spinnaker-wavefront make container push

```

## Run Servo (as a docker container)
```
docker run -d --name opsani-servo \
    -v /path/to/optune_auth_token:/opt/optune/auth_token \
    -v /path/to/config.yaml:/servo/config.yaml \
    opsani/servo-spinnaker-wavefront --auth-token /opt/optune/auth_token --account my_account my_app
```

Where:
 * `/path/to/optune_auth_token` - file containing the authentication token for the Optune backend service
 * `/path/to/config.yaml:` - config file containing the configuration for the [spinnaker](https://github.com/opsani/servo-spinnaker) and [wavefront](https://github.com/opsani/servo-wavefront) drivers (see links for details on how to configure each).
 * `my_account` - your Optune account name
 * `my_app` - the application name

There may be additional files required or supported by the drivers that may need to be mounted in the container, refer to the driver documentation for details.
