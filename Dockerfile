FROM python:3.6-slim

WORKDIR /servo

# Install dependencies
RUN pip3 install jsonpath_ng requests PyYAML wavefront-api-client
RUN apt update && mkdir -p  /usr/share/man/man1/ && apt -y install openjdk-8-jre-headless


# Install servo
ADD https://raw.githubusercontent.com/opsani/servo-spinnaker/master/adjust \
    https://raw.githubusercontent.com/opsani/servo-wavefront/master/measure \
    https://raw.githubusercontent.com/opsani/servo/master/measure.py \
    https://raw.githubusercontent.com/opsani/servo/master/adjust.py \
    https://raw.githubusercontent.com/opsani/servo/master/servo \
    /servo/

ADD https://raw.githubusercontent.com/opsani/encoder-jvm/master/encoders/__init__.py  \
    https://raw.githubusercontent.com/opsani/encoder-jvm/master/encoders/jvm.py \
    https://raw.githubusercontent.com/opsani/servo/master/encoders/base.py \
    /servo/encoders/

RUN chmod a+rwx /servo/adjust /servo/measure /servo/servo

ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "python3", "servo" ]
