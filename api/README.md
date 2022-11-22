## SETUP

#### Install Ruby
Install Ruby version 3.1.2 with rvm

```bash
rvm install "ruby-3.1.2"
rvm use 3.1.2
```

#### Install Bundler
Bundler is the package manager used for this project. Install it globally using the below command.

```bash
gem install bundler
```

#### Install the dependencies using Bundler:
```bash
bundle install
```

#### Copy .env.example to .env:
```bash
cp .env.example .env
```

#### Setup the database:
```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

#### Start the development server on http://localhost:3001
```bash
bundle exec rails s
```

#### Run the tests:
```bash
bundle exec rspec
```