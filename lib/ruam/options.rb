# Copyright (C) 2017 autopp
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

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
