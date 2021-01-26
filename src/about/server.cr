require "athena"

# Require everything for this microservice
require "./**"

# Require any shared libraries
require "../shared/listeners/*"
require "../shared/initializers/*"

# Run the server
ART.run
