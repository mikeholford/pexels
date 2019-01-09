# Pexels

An unofficial, open source Ruby wrapper for the [Pexels REST API](https://www.pexels.com/api). The source code is available on GitHub at [https://github.com/mikeholford/pexels](https://github.com/mikeholford/pexels).

N.B. When using this gem you still need to abide to Pexels Guidelines, which are explained on [Pexels API page](https://www.pexels.com/api)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pexels'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pexels

## Usage

### API Access Key

Firstly, you'll need an API Key. [Request accesss here](https://www.pexels.com/api/new/)

### Configuration

Configure the gem in an initializer with you API Key

```ruby
# app/config/initializers/pexels.rb

Pexels.configure do |config|
  config.access_token = "563492ad6f91700001000001a9099b0e2801496db40fb7cfd0801845"
end
```

## Examples

Below are some examples of what you can currently use the gem for with the Pexels API. If anything is missing or broken please create a Bg report or pull request with a fix.

### Get a photo with id

If you know the ID of the Pexels photo, you can fetch it directly
```ruby
photo = Pexels::Photo.get(PHOTO_ID)
```

### Search photos

The search method accepts three arguments: (query, per_page, page). Variables `per_page` (max: 80) and `page` (max: 1000) are optional and default at 15 & 1 respectively.
```ruby
search_results = Pexels::Photo.search('The Ocean')
```

### Fetch curated collection

Fetch the most recent curated collection of photos. It **does not** accept `query`, but it also **does** accept `per_page` and `page`
```ruby
search_results = Pexels::Photo.curated
```

### Fetch random curated photo

Fetch a random photo from the curated collection.
```ruby
photo = Pexels::Photo.random
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pexels. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pexels project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pexels/blob/master/CODE_OF_CONDUCT.md).
