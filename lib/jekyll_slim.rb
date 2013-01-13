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
      config = (@config['slim'] ||= {}).dup
      config.each { |key, value| config[key.to_sym] = value }
      config.reject! { |key| key.is_a? String }
      @config['slim'] = config
    end
  end
end
