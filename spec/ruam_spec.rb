require 'spec_helper'

describe Ruam do
  describe '.optimization_flags' do
    subject { described_class.optimization_flags }
    it 'returns strings according to names defined in the VM' do
      options = RubyVM::InstructionSequence.compile_option.keys
      expected = (options - %i[debug_level]).sort

      expect(subject.sort).to eq(expected)
    end
  end
end
