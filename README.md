# mongowiki

mongowiki is an sinatra-based wiki application, which persists your articles into an mongodb

## Travis CI

[![Build Status](https://secure.travis-ci.org/gr4y/mongowiki.png?branch=master)](http://travis-ci.org/gr4y/mongowiki)

## Installation
### stable release

	$ gem install mongowiki

### prerelease

	$ gem install mongowiki --pre
	
create a *config.ru* file somewhere on your filesystem, which is in my case */var/apps/mongowiki*

	ENV['MONGO_URL'] = "mongodb://SERVER:27017/database"
	
	require 'mongowiki'
	run MongoWiki.run!

#### Environment variables

**MONGO_URL**
URI to the MongoDB instance. For example: mongodb://username:passwort@server:27017/database

## Contribution
### Patches & Pull Requests

You want to add a feature or you want to patch mongowiki?

1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore	when I pull)
5. Send me a pull request. Bonus points for topic branches.