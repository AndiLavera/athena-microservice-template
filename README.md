# Athena Microservice Template

# Potential Problems

- In monolith mode, an event listener will be invoked regardless of the microservice it is defined it. IE: An event listener listening to requests will be invoked on any request.
