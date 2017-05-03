require 'optparse'

module Ruam
  # Command line option parser
  #
  class Options
    def self.parse(argv)
      options = { compile_options: {} }
      parser = create_parser(options[:compile_options])
      begin
        argv = parser.parse(argv)
        raise ParseError, 'more than one file is specified' if argv.size > 1
      rescue OptionParser::InvalidOption => e
        raise ParseError, e.message
      end
      options[:file] = argv.first
      options
    end

    def self.create_parser(options)
      parser = OptionParser.new
      Ruam.optimization_flags.each do |flag|
        parser.on("--[no-]#{flag.to_s.tr('_', '-')}") do |v|
          options[flag] = v
        end
      end
      parser.on('--debug-level=LEVEL') do |v|
        options[:debug_level] = v.to_i
      end
    end

    class ParseError < StandardError
    end
  end
end
