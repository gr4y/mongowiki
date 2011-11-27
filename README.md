mongowiki
=========

mongowiki is an sinatra-based rack-application which saves all data to an mongodb

Installation
------------

	$ gem install mongowiki
	
create a *config.ru* file somewhere on your filesystem, which is in my case */var/apps/mongowiki*

	ENV['MONGO_HOST'] = "server"
	ENV['MONGO_DB'] = "mongowiki"

	require 'mongowiki'

	map '/assets' do
  	run MongoWiki::Assets.new
	end

	map '/' do
  	run MongoWiki::Application.new
	end	
	
depending on how your mongodb server is configured, you need to set the corresponding environment variables.
	
Environment variables
--------------------

You can set all this variables in your **config.ru**

**MONGO_HOST**
the host where mongodb is installed (defaults to: **localhost**)

**MONGO_PORT**
the port where the mongodb server is listening (defaults to: **27017**)

**MONGO_DB**
the database name of the mongowiki db

**MONGO_USER**
the username 

**MONGO_PASSWORD**
the password 

Contribution
------------

### Patches & Pull Requests

You want to add a feature or you want to patch mongowiki?

1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore	when I pull)
5. Send me a pull request. Bonus points for topic branches.