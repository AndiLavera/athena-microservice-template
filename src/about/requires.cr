# Requires for any shared libraries
require "../shared/listeners/*"

# Only require snowpacker in dev environments
{% if flag? :dev_all %}
  require "../shared/initializers/snowpacker"
{% end %}

# Requires for this microservice
require "./controllers/*"
