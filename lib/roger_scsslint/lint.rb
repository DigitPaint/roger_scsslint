require 'roger/test'
require 'scss_lint'
require 'scss_lint/cli'
require 'scss_lint/runner'

module RogerScsslint
  # SCSS linter plugin for Roger
  class Lint
    # Configurability is the root of all evil
    # http://fishshell.com/docs/current/design.html#conf
    def initialize(*)
      @command = "scss-lint"
    end

    def detect_scsslint
      command = [@command, "-v", ">/dev/null"]
      detect = system(Shellwords.join(command))
      fail 'Could not find linter. Linter should be in Gemfile. ' unless detect
    end

    def call(test, _options)
      detect_scsslint
      test.log(self, 'SCSS linting files')
      system(@command)
    end
  end
end

Roger::Test.register :scsslint, RogerScsslint::Lint
