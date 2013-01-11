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
      Slim::Template.new { content }.render
    end
  end

  class SlimLogicLessConverter < SlimConverter
    def convert(content)
      Slime::Template.new(:logic_less => true) { content }.render
    end
  end
end
