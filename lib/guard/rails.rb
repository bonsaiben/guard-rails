require 'guard'
require 'guard/guard'
require 'guard/rails/runner'
require 'rbconfig'

module Guard
  class Rails < ::Guard::Guard
    # Use gem `version` to support versioning
    # is_versioned

    attr_reader :options, :runner

    DEFAULT_OPTIONS = {
      :CLI => nil,
      :daemon => false,
      :debugger => false,
      :environment => 'development',
      :force_runs => false,
      :pid_file => nil, # construct the filename based on options[:environment] on runtime
      :port => 3000,
      :server => nil, # specified by rails
      :start_on_start => true,
      :timeout => 30,
      :zeus_plan => 'server',
      :zeus => false,
    }

    def initialize(watchers = [], options = {})
      super
      @options = DEFAULT_OPTIONS.merge(options)

      @runner = RailsRunner.new(@options)
    end

    def start
      server = options[:server] ? "#{options[:server]} and " : ""
      UI.info "Guard::Rails will now restart your app on port #{options[:port]} using #{server}#{options[:environment]} environment."
      reload("start") if options[:start_on_start]
    end

    def reload(action = "restart")
      action_cap = action.capitalize
      UI.info "#{action_cap}ing Rails..."
      Notifier.notify("Rails #{action}ing on port #{options[:port]} in #{options[:environment]} environment...", :title => "#{action_cap}ing Rails...", :image => :pending)
      if runner.restart
        UI.info "Rails #{action}ed, pid #{runner.pid}"
        Notifier.notify("Rails #{action}ed on port #{options[:port]}.", :title => "Rails #{action}ed!", :image => :success)
      else
        UI.info "Rails NOT #{action}ed, check your log files."
        Notifier.notify("Rails NOT #{action}ed, check your log files.", :title => "Rails NOT #{action}ed!", :image => :failed)
      end
    end

    def stop
      Notifier.notify("Until next time...", :title => "Rails shutting down.", :image => :pending)
      runner.stop
    end

    def run_on_changes(paths)
      reload
    end

    alias :run_on_change :run_on_changes
  end
end
