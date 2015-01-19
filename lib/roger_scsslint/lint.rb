require 'roger/test'
require 'scss_lint'
require 'scss_lint/cli'
require 'scss_lint/runner'

module RogerScsslint
  # SCSS linter plugin for Roger
  class Lint
    # Configurability is the root of all evil
    # http://fishshell.com/docs/current/design.html#conf
    def initialize(_options = {})
    end

    # access scss-lint methods to do printing ourselves
    def modify_scsslint_cli
      def @cli.setup_configuration_public(*args)
        setup_configuration(*args)
      end
      def @cli.scan_for_lints_public(*args)
        scan_for_lints(*args)
      end
      def @cli.files_to_lint_public(*args)
        files_to_lint(*args)
      end
    end

    def lint_report(test, runner)
      success = true
      sorted_lints = runner.lints.sort_by { |l| [l.filename, l.location] }
      sorted_lints.map do |lint|
        test.log(self,
                 (lint.error? ? '[E]' : '[W]') +
                 " #{lint.filename}:#{lint.location.line} #{lint.linter.name}: #{lint.description}")
        success = false if lint.error?
      end
      success
    end

    def call(test, _options)
      test.log(self, 'SCSS linting files')

      @cli = SCSSLint::CLI.new
      modify_scsslint_cli
      linteroptions = SCSSLint::Options.new.parse([])
      linterconfig = @cli.setup_configuration_public(linteroptions)

      runner = SCSSLint::Runner.new(linterconfig)
      runner.run @cli.files_to_lint_public(linteroptions, linterconfig)
      lint_report(test, runner)
    end
  end
end

Roger::Test.register :scsslint, RogerScsslint::Lint
