require_relative "../lib/roger_scsslint/lint.rb"
require "test/unit"

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
  def setup
    @file_name = ".scss-lint.yml"
    assert !File.exist?(@file_name), ".scss-lint.yml file already exists."
    FileUtils.cp("./test/data/sample-scss-lint.yml", "./.scss-lint.yml")
  end

  def test_lint
    faketester = TesterStub.new

    linter = RogerScsslint::Lint.new
    linter.call(faketester, {})

    assert_equal(faketester.messages,
                 ["SCSS linting files"])
  end

  def teardown
    File.unlink @file_name
  end
end
