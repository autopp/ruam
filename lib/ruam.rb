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
