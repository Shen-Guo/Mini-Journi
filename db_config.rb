require 'pg'
require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'journi_app'
}

ActiveRecord::Base.establish_connection(options)