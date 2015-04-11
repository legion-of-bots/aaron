%w[

  dsl
  errors
  extensions
  scheduler
  task
  version

].each { |f| require_relative "aaron/#{f}" }

module Aaron

  class Aaron

    attr_reader :config, :file

    @@possible_config_file_locations = %w[
      ~/aaron.rb
    ].map { |f| File.expand_path(f) }

    def self.locate_config_file
      @@possible_config_file_locations.find { |p| File.exists?(p) }
    end

    def self.run
      config_file = Aaron.locate_config_file
      if config_file
        Aaron.from_file(config_file).run
      else
        raise Errors::ConfigFileNotFound.new %Q(
          Aaron was unable to locate his config file.
          He looked in
          #{@@possible_config_file_locations.join("\n")}
        )
      end
    end

    def self.from_file file
      Aaron.new(File.read(file), file)
    end

    def initialize config, file = nil
      @config = config
      @file   = file
    end

    def get_binding
      DSL.new.instance_eval { binding }
    end

    def run
      eval(config, get_binding, file).run
    end

  end

end
