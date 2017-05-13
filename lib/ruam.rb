require 'ruam/version'

# Top level namespace for ruam
#
module Ruam
  def self.optimization_flags
    RubyVM::InstructionSequence.compile_option.keys - %i[debug_level]
  end

  def self.run(argv)
    options = Options.parse(argv)
    file = options[:file]
    compile_options = RubyVM::InstructionSequence.compile_option.merge(options[:compile_options])

    insns = if file
              RubyVM::InstructionSequence.compile_file(file, compile_options)
            else
              RubyVM::InstructionSequence.compile($stdin.read, nil, nil, 1, compile_options)
            end
    puts insns.disasm
  end
end

require 'ruam/options'
