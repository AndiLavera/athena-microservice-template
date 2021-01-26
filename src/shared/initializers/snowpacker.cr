require "snowpacker"
# Include the Snowpacker Athena event listener
require "snowpacker/ext/athena"

# Ensure Snowpacker runs the Snowpack dev server in development mode.
Snowpacker::Engine.configure do |config|
  # TODO: Remove the `?` so the server crashes if `ATHENA_ENV` isn't set?
  # I am thinking someone may want the snowpack server on but forgot to set this.
  # I could move this into a method, rescue the error and provide a nice error message?
  config.enabled = ENV["ATHENA_ENV"]? == "development"
end

Snowpacker::Engine.run
