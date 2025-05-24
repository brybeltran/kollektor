# Installation

Make sure you have:
```
Ruby: 3.2.2
Postgres: 15+
```

1. Clone and install gems
```
git clone https://github.com/brybeltran/kollektor.git
cd kollektor
bundle install
```

2. Install JS packages
`yarn install`

3. Set up database
`bin/rails db:setup`

4. Start sidekiq
`bundle exec sidekiq`

5. Start the Rails server
`bin/dev`

(Optional):
- Run the test suite
  `bundle exec rspec`

- See Sidekiq on the web: `http://localhost:3000/sidekiq`
