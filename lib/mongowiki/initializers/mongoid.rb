# set mongoid logger in production
Mongoid.logger.level = 3 if Happy.env.production?

# connect mongoid to the mongodb instance
if mongo_uri = ENV['MONGO_URL']
  Mongoid.use(mongo_uri)
else
  raise "MONGO_URL environment variable not set"
end