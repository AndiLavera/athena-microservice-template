require "athena"

require "./requires"

require "snowpacker"
require "snowpacker/ext/athena"

Snowpacker::Engine.configure do |config|
  config.enabled = true
end

Snowpacker::Engine.run

{% if flag?(:athena_all) %}
  require "../about/micro"
{% end %}

# Run the server
ART.run
