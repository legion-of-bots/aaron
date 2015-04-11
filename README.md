# Aaron (random cron)

[![Gem Version](https://badge.fury.io/rb/aaron.svg)](http://badge.fury.io/rb/aaron)

[![Code Climate](https://codeclimate.com/github/legion-of-bots/aaron/badges/gpa.svg)](https://codeclimate.com/github/legion-of-bots/aaron) [![Test Coverage](https://codeclimate.com/github/legion-of-bots/aaron/badges/coverage.svg)](https://codeclimate.com/github/legion-of-bots/aaron) [![Build Status](https://travis-ci.org/legion-of-bots/aaron.svg?branch=master)](https://travis-ci.org/legion-of-bots/aaron) [![Dependency Status](https://gemnasium.com/legion-of-bots/aaron.svg)](https://gemnasium.com/legion-of-bots/aaron)

Randomize the execution of tasks

## Installing

    $ gem install aaron

## Usage

To use Aaron simply create a `aaron.rb` file in your home directory (`~/aaron.rb`).

The `aaron.rb` file is the config file for Aaron.

Every task begins with `every` followed by an interval (or range) followed by
the thing to execute. An example `aaron.rb` file is below.

```ruby
# Since the arron.rb file is ruby #s can be used for comments

# You can specify an range that you want a task to be ran between.  A random time
# within that range will be used.
every 20.minutes.to(30.minutes) { File.write("~/test", (File.read("~/test").to_i || 1) + 1) }

# The block passed to every is what will be ran

# If you don't want to you don't have to specify a range.  Here something_awesome
# will happen every 20 minutes
every 20.minutes do
  something_awesome
end

# To make executing simple shell command easier you can use this syntax below.
# Here the shell command ~/repos/orange-soapstone/bin/orange-soapstone will be
# ran between every 4 and 7 hours.
every 4.hours.to(7.hours), exec { "~/repos/orange-soapstone/bin/orange-soapstone" }
# Note the comma right   ^ there.

# When using exec you're passing a block to the exec method which converts it to
# A Proc when sending it to every.  This means it needs to be sent as an argument
# and not a block.  Hence the comma.
```

### Specifying ranges

It is possible to pass just a simple range to `every`.  However some helper
methods have been added to the `Fixnum` class to make specifying the range of
time you want a task executed in.

#### The to method

The `to` method takes a `Fixnum` and returns a range starting at self and ending
at the parameter passed to it.

    1.to 2 # => (1..2)

### Time helper methods

You may have noticed some helper methods have been added to help specify units
of time.  These methods are

- second
- minute
- hour
- day
- week

and their plural versions (i.e. `seconds`) also work too.
