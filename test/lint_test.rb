require_relative '../lib/roger_scsslint/lint.rb'
require 'test/unit'

# Fake tester to pass into the linter plugin
class TesterStub
  attr_reader :messages

  def initialize
    @messages = []
  end

  def log(_, message)
    @messages.push(message)
  end
end

# Linting plugin unit test
class LintTest < Test::Unit::TestCase
  def test_lint
    faketester = TesterStub.new

    linter = RogerScsslint::Lint.new
    linter.call(faketester, {})

    assert_equal(faketester.messages,
                 ['SCSS linting files',
                  '[W] test/test.scss:1 SingleLinePerSelector: Each selector '\
                  'in a comma sequence should be on its own line',
                  '[W] test/test.scss:2 ZeroUnit: `0px` should be written without units as `0`',
                  '[W] test/test.scss:3 FinalNewline: Files should end with a trailing newline'])
  end
end
