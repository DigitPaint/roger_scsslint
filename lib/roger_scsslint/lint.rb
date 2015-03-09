require "roger/test"
require "scss_lint"
require "scss_lint/cli"
require "scss_lint/runner"

module RogerScsslint
  # SCSS linter plugin for Roger
  class Lint
    # Configurability is the root of all evil
    # http://fishshell.com/docs/current/design.html#conf
    def initialize(options = {})
      @options = {
        config_file: ".scss-lint.yml",
        scss_lint: "scss-lint"
      }

      detect_scsslint
      @options.update(options) if options
    end

    def call(test, _options)
      test.log(self, "SCSS linting files")
      system(Shellwords.join([@options[:scss_lint], "--config=#{@options[:config_file]}"]))
    end

    private

    def detect_scsslint
      command = [@options[:scss_lint], "-v", ">/dev/null"]
      detect = system(Shellwords.join(command))
      fail "Could not find linter. Linter should be in Gemfile." unless detect
    end
  end
end

Roger::Test.register :scsslint, RogerScsslint::Lint
