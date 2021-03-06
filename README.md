# Guard-rails is watching on your railses!

[![Gem Version](https://badge.fury.io/rb/guard-rails.png)](http://badge.fury.io/rb/guard-rails)
[![Build Status](https://travis-ci.org/ranmocy/guard-rails.png)](https://travis-ci.org/ranmocy/guard-rails)
[![Dependency Status](https://gemnasium.com/ranmocy/guard-rails.png)](https://gemnasium.com/ranmocy/guard-rails)
[![Code Climate](https://codeclimate.com/github/ranmocy/guard-rails.png)](https://codeclimate.com/github/ranmocy/guard-rails)

## Want to restart your Rails development server whilst you work? Now you can!

    guard 'rails', :port => 5000 do
      watch('Gemfile.lock')
      watch(%r{^(config|lib)/.*})
    end

## Lots of fun options growing!

* `:daemon` runs the server as a daemon, without any output to the terminal that ran `guard` (**default `false`**)
* `:debugger` enable the debugger in server. Required ruby-debug gem. (**default `false`**)
* `:environment` is the server environment (**default `development`**)
* `:force_run` kills any process that's holding the listen port before attempting to (re)start Rails (**default `false`**)
* `:pid_file` specify your pid\_file (**default `tmp/pids/[RAILS_ENV].pid`**)
* `:port` is the server port number (**default `3000`**)
* `:server` the webserver engine to use (**try `:server => :thin`**)
* `:start_on_start` will start the server when starting Guard (**default `true`**)
* `:timeout` waits when restarting the Rails server, in seconds (**default `30`**).
* `:zeus_plan` the [custom plan](https://github.com/burke/zeus/blob/master/docs/ruby/modifying.md) in zeus, only works when `zeus` option is `true` (**default `server`**)
* `:zeus` support [zeus](https://github.com/burke/zeus) to boost rails init speed (**default `false`**).
* `:CLI` construct the runner command as your willing! Will omit all options above except `pid_file`! (**default `rails server --pid tmp/pids/[RAILS_ENV].pid`**)

## How-to

* **Multiple instances** use `pid_file` option to run multiple instances with same rails\_env

## Contribute
Feel free to fork'n'fix for any willing.

Or

Tell.me in: any.way

## Philosophy

* [Semantic Version](http://semver.org/)
