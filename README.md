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
