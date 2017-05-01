require 'ruam/version'

# Top level namespace for ruam
#
module Ruam
  def self.optimization_flags
    RubyVM::InstructionSequence.compile_option.keys - %i[debug_level]
  end
end

require 'ruam/options'
