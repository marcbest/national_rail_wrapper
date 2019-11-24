# NationalRailWrapper

A wrapper around the National Rail open data API 

| Service                        | Integrated      |
| ------------------------------ | --------------- |
| Knowledge Base                 | Yes             |
| Historical Service Performance | Yes             |
| Live Departure Boards          | No              |

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'national_rail_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install national_rail_wrapper

## Usage
client = NationalRailWrapper::Feeds::Client.new(username: username, password: password)

### Knowledge Base 
```
client = NationalRailWrapper::Feeds::KnowledgeBase::Client.new(username: USER_NAME, password: PASSWORD)
```
#### Incidents 
```
client.incidents
```
#### National Service Indicators 
```
client.national_service_indicators
```
#### Public Promotions 
```
client.public_promotions
```
#### Stations 
```
client.stations
```
#### Ticket Restrictions 
```
client.ticket_restrictions
```
#### Ticket Types 
```
client.ticket_types
```
#### TOC's 
```
client.tocs
```

### Historical Service Performance
```
client = NationalRailWrapper::Feeds::HistoricalServicePerformance::Client.new(username: USER_NAME, password: PASSWORD)
```

#### ServiceMetrics 
```
params = {
    from_loc: 'HML',
    to_loc: 'EUS',
    from_time: '0800',
    to_time: '0822',
    from_date: '2019-10-01',
    to_date: '2019-10-01',
    days: 'WEEKDAY'
}

client.service_metrics(params)
```
#### ServiceDetails 
```
rid = '201607294212242'
client.service_details(rid)
```

#### Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/national_rail_wrapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NationalRailWrapper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/national_rail_wrapper/blob/master/CODE_OF_CONDUCT.md).
