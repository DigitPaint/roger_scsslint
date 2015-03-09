require "open-uri"

# <- hekje
module Roger
  # <- hekje
  module Cli; end
end

require "roger/cli/generate"
require "roger/cli/command"
require "roger/generators"

module RogerScsslint
  # Lint configuration retriever
  class Generator < Roger::Generators::Base
    include Thor::Actions
    CONFIG_PATH = ".scss-lint.yml"
    DEFAULT_CONFIG_URL = "https://raw.githubusercontent.com/" \
      "DigitPaint/css/master/linters/.scss-lint.yml"

    desc "Scsslint generator creates an .scss-lint.yml config file"
    class_option(
      :config,
      type: :string,
      aliases: ["-c"],
      desc: "Optional config file to use takes a path or url, by
             default it uses the company' default"
    )

    class_option(
      :force,
      type: :boolean,
      aliases: ["-f"],
      desc: "Always overwrite the config file"
    )

    # Write config file
    def write_config_file
      if options[:config]
        config = open(options[:config]).read
      else
        config = open(DEFAULT_CONFIG_URL).read
      end

      # Create file check if we don't have a conflict or something
      create_file "#{@project.path}/#{CONFIG_PATH}", config, force: options[:force]
    end
  end
end

Roger::Generators.register RogerScsslint::Generator
