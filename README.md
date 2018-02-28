# CONSUL PROJECT

Dashboard to monitor the health of [CONSUL](https://github.com/consul/consul) installations

## Configuration for development

Prerequisites: install git, Ruby 2.5.0, `bundler` gem, and PostgreSQL (>=9.4).

```bash
git clone https://github.com/consul/consulproject.git
cd consulproject
bundle install
cp config/database.yml.example config/database.yml
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
bin/rails dev:cache
```

Run the app locally:

```
bin/rails s
```

## Setting up a Github access token
Create a [Github token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

Open the credentials files:
```
bin/rails credentials:edit
```

Add the following line:
```
github_access_token: your_token
```

Save the file, close it, and you should be ready to go!

## License

Code published under AFFERO GPL v3 (see [LICENSE-AGPLv3.txt](LICENSE-AGPLv3.txt))

