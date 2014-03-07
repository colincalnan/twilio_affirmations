require 'twilio-ruby'
require 'iron_cache'
require 'yaml'

config = YAML.load_file("config.yml")
account_sid = config['twilio']['account_sid']
auth_token = config['twilio']['auth_token']
project_id = params[:config][:project_id]
token = params[:config][:token]
number = params[:number]

twilio = Twilio::REST::Client.new account_sid, auth_token
ironcache = IronCache::Client.new(:project_id => project_id, :token => token)

puts "Found number #{number}"

cache = ironcache.cache("affirmation-#{number}")

day = cache.get("day")
puts "Incrementing Day Cache in cache #{cache.name}"
cache.increment("day")

next_affirmation = cache.get(day.value.to_s).value

message = "Today's affirmation is: #{next_affirmation}"
puts message

twilio.account.sms.messages.create(
  :from => config['app']['from'],
  :to => number,
  :body => message
)