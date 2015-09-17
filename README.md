[travis]: https://travis-ci.org/blacktangent/buttons_for
[codeclimate]: https://codeclimate.com/github/blacktangent/buttons_for
[fontawesome]: https://fortawesome.github.io/Font-Awesome
[fontawesomerails]: https://github.com/bokmann/font-awesome-rails
[coveralls]: https://coveralls.io/r/blacktangent/buttons_for
[rubygems]: https://rubygems.org/gems/buttons_for

# ButtonsFor

[![Build Status](https://travis-ci.org/blacktangent/buttons_for.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/blacktangent/buttons_for/badges/gpa.svg)][codeclimate]
[![Test Coverage](http://img.shields.io/coveralls/blacktangent/buttons_for/master.svg)][coveralls]
[![Gem Version](http://img.shields.io/gem/v/buttons_for.svg)][rubygems]

ActiveView helper to generate Bootstrap buttons and dropdown-buttons.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'buttons_for'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install buttons_for

Run generator to add I18n locales:

    $ rails generate buttons_for:install

The gem depends on [Bootstrap 3](http://getbootstrap.com/) to create buttons and dropdown-buttons. Bring bootstrap into
your project by using [Bootstrap for Sass](https://github.com/twbs/bootstrap-sass) or you preferred method.

`buttons_for` depends on [Font Awesome][fontawesome] icon and CSS
framework, bring [Font Awesome][fontawesome] into your project using
[font-awesome-rails][fontawesomerails] or your preferred method.

## Screenshot
![Screenshot](https://cloud.githubusercontent.com/assets/1222916/9902312/b08d89bc-5c97-11e5-94c6-7a0e78934556.png)

## Usage

`buttons_for` has multiple helper methods. The API is intentionally made
quite simple and does not support url generation or any advanced
functionallity. It's just ment as a thin wrapper around `link_to` and
should pass the options transparently.

The helpers you'll use the most provide buttons with a color and a
leading icon. The following standard buttons can be used: `new`, `edit`,
`delete` and `export`. These buttons are just wrappers around the `button` helper
giving it options containing icon and button class.

`buttons_for` also provides a helper for creating dropdown buttons. Use
`dropdown` with a block containing `link` elements to achive this.

Example show button menu:

```erb
<%= buttons_for do |b| %>
  <%= b.dropdown :actions do %>
    <%= b.link "Projects", company_projects_path(@company), icon: "list" %>
  <% end %>
  <%= b.button t(".lock"), lock_company_path(@company), icon: "lock", class: "btn-default" %>
  <%= b.edit edit_company_path(@company) %>
  <%= b.delete company_path(@company) %>
<% end %>
</div>
```

Example index button menu:

```erb
<%= buttons_for do |b| %>
  <%= b.new url_for(action: :new) %>
  <%= b.export url_for(format: :csv) %>
<% end %>
```

## Options

Available options:

* __:label__ - Override standard label.
* __:class__ - Appendse given string to existing CSS classes.
* __:icon__  - Prefix or replace exsiting icon.

## Translations

The installer copies the file `buttons_for.en.yml` into your
`config/locales/` directory. Add a corresponding file with your own
locale to translate the buttons.

## Sample
Sample applicaiton using `buttons_for` can be found [here](https://github.com/blacktangent/buttons_for-demo).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/blacktangent/buttons_for. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

