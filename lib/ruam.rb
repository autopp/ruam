require 'ruam/version'

# Top level namespace for ruam
#
module Ruam
  def self.optimization_flags
    RubyVM::InstructionSequence.compile_option.keys - %i[debug_level]
  end

  def self.run(argv)
    begin
      options = Options.parse(argv)
    rescue Options::ParseError => e
      $stderr.puts e.message
      return
    end
    file = options[:file]
    compile_options = RubyVM::InstructionSequence.compile_option.merge(options[:compile_options])
    insns = RubyVM::InstructionSequence.compile_file(file, compile_options)
    puts insns.disasm
  end
end

require 'ruam/options'
