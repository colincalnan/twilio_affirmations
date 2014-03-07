
Setup:

1. Sign up for free accounts at Twilio.com and Iron.io
2. git clone https://github.com/colincalnan/twilio_affirmations.git
3. cd twilio_affirmations
4. sudo bundle install (iron_worker_ng has the iron_worker command line interface)
5. fill in values in config/config.yml file
6. fill in values in workers/iron.json
7. cd workers
8. iron_worker upload affirmation

To Run:

1. return to twilio_affirmation directory
2. ruby web.rb
3. browse to http://localhost:4567/
4. enter a number and click "Let's get positive!"


Checking that things worked:

- uploaded code package: on iron.io: Affirmation
- one scheduled task
- You'll get your first SMS
- Go to IronCache and you'll see the cache created