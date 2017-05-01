require 'optparse'

module Ruam
  # Command line option parser
  #
  class Options
    def self.parse(argv)
      options = { compile_options: {} }
      parser = create_parser(options[:compile_options])
      file = parser.parse(argv).first
      options[:file] = file
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
  end
end
