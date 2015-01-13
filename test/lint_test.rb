require_relative "../lib/roger_scsslint/lint.rb"
require "test/unit"

class TesterStub
  def initialize
    @messages = Array.new
  end

  def log(_, message)
    @messages.push(message)
  end

  def get_messages
    @messages
  end
end

class LintTest < Test::Unit::TestCase
  def test_lint
    faketester = TesterStub.new

    linter = RogerScssLint::Lint.new
    linter.call(faketester, Hash.new)

    assert_equal(faketester.get_messages,
      ["SCSS linting files",
       "[W] test.scss:1 SingleLinePerSelector: Each selector in a comma sequence should be on its own line",
       "[W] test.scss:2 ZeroUnit: `0px` should be written without units as `0`",
       "[W] test.scss:3 FinalNewline: Files should end with a trailing newline"])
  end
end