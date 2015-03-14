# api_rspec
Template to test REST API with RSpec and HTTParty

#HTTParty Todo's Project
This repository contains a project of testing an API using RSpec and HTTParty.

##Installation
To install the project, you can open up your preferred terminal and run the following:

```ruby
bundle install
```

This will install all the required Rubygems using the Gemfile.

##Running the tests
To run the tests using RSpec, run the following in the terminal:

```ruby
rspec
```

This will run through all of the rests in the suite and you will be able to see within the terminal whether the tests have passed or failed.

The API being tested is located at ```http://lacedeamon.spartaglobal.com/todos```.

##Important files
###Spec_helper
Since the project is using RSpec to run tests, it requires a files called ```spec_helper.rb``` in order to run. This file will contain any code that you find will be repeated throughout testing. For example - logging into a website at the start of each test.

The spec_helper file in this project uses the following methods:

```ruby
url
delete_all
create_todos
```

If you would like to know more regarding this project, please contact me at trishulgohil@live.co.uk
