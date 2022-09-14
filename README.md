---
# docker-default-entrypoint
Docker default-entrypoint scripts

## Introduction

This entrypoint script allows the customization of the container configuration or pre-check of external services.
To do this, simply drop your specialized script in the /docker-entrypoint.d folder. It will be executed each time the container is launched before the application command.

For example :
 - Your custom script can generate a configuration file from the values of the environment variables passed to the container. 
 - Your custom script can initialize the structure of a database. 
 - Your script can perform checks on the availability of another component that must have started before.
 - ...

Basic log functions are provided and can be used in your specialized scripts.


---

## How to use in your Dockerfile

``` Dockerfile
[...]

COPY ./docker-entrypoint.d/* /docker-entrypoint.d/
COPY ./docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh ; chmod +x /docker-entrypoint.d/*

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/path/to/container app", "--app-arg", "--app-arg"]
```
