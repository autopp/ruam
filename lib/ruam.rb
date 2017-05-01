require 'ruam/version'

# Top level namespace for ruam
#
module Ruam
  def self.compile_option_names
    RubyVM::InstructionSequence.compile_option.keys.map do |opt|
      "--#{opt.to_s.tr('_', '-')}"
    end
  end
end

require 'ruam/options'
