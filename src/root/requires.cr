# Require everything for this microservice
require "./**"

# Require any shared libraries
require "../shared/listeners/*"
require "../shared/initializers/*"

# Require all other microservices if the compiler flag `athena_all` is passed in.
# This flag enables you to run/build the entire app as a monolith.
{% if flag?(:athena_all) %}
  # Add any new microservices here.
  #
  # To add a new microservice, create a folder in `src` and add the folder name to the
  # `microservices` array.
  {%
    microservices = [
      "about",
    ]
  %}

  {% for microservice in microservices %}
    require {{"../#{microservice.id}/requires"}}
  {% end %}

  # If you would like to place microservices in a different directory, add them here.
  # require "../path/to/my/microservice"
{% end %}