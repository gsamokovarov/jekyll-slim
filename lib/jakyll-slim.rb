require 'slim'

module Jekyll
  class SlimConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /slim/i
    end

    def output_ext(ext)
      '.html'
    end

    def convert(content)
      Slim::Template.new(@config['slim']) { content }.render
    end
  end
end
