# UtmCookies

Sets a permanent cookie for utm_source, utm_medium, utm_campaign, utm_term, utm_content querystring values so you can include them in your lead gen forms. Here's how we are using them:

1) We have our own Keen.io pageview/event stats tracker that sits alongside google analytics and other packages. utm values are included with each logged event.

2) On all lead generation forms, we have hidden values for the utm_ values, which gets fed into our CRM

## Nuances

1) Our analytics javascript set a cookies[:session_cookie] that expires 30 minutes after the last pageview (like Google Analytics). If any utm_ value changes, we delete that cookie within this gem, which creates a new session (this mimics Google Analytics behavior)

2) All cookies are stored as the same name as the utm_ key from they querystring (e.g. use cookies[:utm_campaign] for the utm_campaign value)

## Installation

Add this line to your application's Gemfile:

    gem 'utm_cookies', git: 'https://github.com/envisialearning/utm_cookies.git'

And then execute:

    $ bundle

## Usage

Add this to your app/application_controller.rb

    $ include UtmCookies

## Contributing

1. Fork it ( https://github.com/envisialearning/utm_cookies.git )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
