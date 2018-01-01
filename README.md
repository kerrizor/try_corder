# TryCorder

Recently I had a Twitter conversation about the over-reliance on `try` in the Rails community, rather than folks using a NullObject pattern. It is a straight-forward task to search a codebase for uses of `try`, but I was more interested in which classes it was being called on. This gem creates a singleton for counting each use, and provides a method (`report`) for producing a running total.

This code is very much a proof-of-concept, and should NOT be run in production. I've been using it during test runs to get a _sense_ of how a given Rails application is employing the method, and as a precursor to writing a more interesting method usage tracking tool.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'try_corder'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install try_corder

## Usage

Include the reporting output in your rspec helper file like so:

```ruby
RSpec.configure do |config|
  config.after(:suite) do
    TryCorder::Reporter.report
  end
end
```

The gem will print out usage numbers at the end of your RSpec run.

```
💗  ➜  rspec ./spec/models/user_spec.rb
Run options: include {:focus=>true}

All examples were filtered out; ignoring {:focus=>true}

Randomized with seed 15281
.........................................................................................................................................................................................................................................................

=====================

User
--------------------
app/models/user.rb:338:: 129
app/models/user.rb:759:: 421
app/models/user.rb:184:: 6


Total uses of :try for this class: 556

Organization
--------------------
app/models/user.rb:338:: 129


Total uses of :try for this class: 129

RSpec::Mocks::Double
--------------------
app/models/user.rb:604:: 1


Total uses of :try for this class: 1

=====================

Finished in 37.44 seconds (files took 11.09 seconds to load)
249 examples, 0 failures

Randomized with seed 15281
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kerrizor/try_corder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TryCorder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kerrizor/try_corder/blob/master/CODE_OF_CONDUCT.md).
