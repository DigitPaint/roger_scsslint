require 'open-uri'

# <- hekje
module Roger
  # <- hekje
  module Cli; end
end

require 'roger/cli/generate'
require 'roger/cli/command'
require 'roger/generators'

module RogerScsslint
  # Lint configuration retriever
  class Generator < Roger::Generators::Base
    include Thor::Actions
    CONFIG_PATH = '.scss-lint.yml'
    DEFAULT_CONFIG_URL = 'https://raw.githubusercontent.com/edwinvd' \
      'graaf/css/f6cac66cba489ea106a8048d6d86f1830d3090c8/.scss-lint.yml'

    desc 'Scsslint generator creates an .scss-lint.yml config file'
    class_option(
      :config,
      type: :string,
      aliases: ['-c'],
      desc: "Optional config file to use takes a path or url, by
             default it uses the company' default"
    )

    # Write config file
    def write_config_file
      if options[:config]
        config = open(options[:config]).read
      else
        config = open(DEFAULT_CONFIG_URL).read
      end

      # Create file check if we don't have a conflict or something
      create_file "#{@project.path}/#{CONFIG_PATH}", config
    end
  end
end

Roger::Generators.register RogerScsslint::Generator
