require 'slim'

module Jekyll
  class SlimConverter < Converter
    safe true

    def initialize(config)
      super
      ensure_config_integrity
    end

    def matches(ext)
      ext =~ /slim/i
    end

    def output_ext(ext)
      '.html'
    end

    def convert(content)
      Slim::Template.new(@config['slim']) { content }.render
    end

    private

    def ensure_config_integrity
      config = @config['slim'] ||= {}
      config.each do |key, value|
        config[key.to_sym] = value
      end
    end
  end
end
