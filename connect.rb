ActiveRecord::Base.logger = Logger.new STDOUT

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  host: "45.55.245.247",
  username: "wyncode",
  password: "wyncode",
  database: "wyncode"
)
