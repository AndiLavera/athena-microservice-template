require "sam"
require "jennifer"
load_dependencies "jennifer"

require "./migrations/*"

require "jennifer_sqlite3_adapter"
# require "jennifer/adapter/postgres" # for PostgreSQL
# require "jennifer/adapter/mysql" # for MySQL

ATHENA_ENV = ENV["ATHENA_ENV"]? || "development"
Jennifer::Config.read("config/database.yml", ATHENA_ENV)

Jennifer::Config.configure do |conf|
  conf.logger = Log.for("db", :debug)
end

Sam.help
