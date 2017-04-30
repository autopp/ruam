require 'spec_helper'

describe Ruam do
  describe '.compile_option_names' do
    subject { described_class.compile_option_names }
    it 'returns strings according to names defined in the VM' do
      expected = RubyVM::InstructionSequence.compile_option.keys.map do |opt|
        "--#{opt.to_s.tr('_', '-')}"
      end.sort

      expect(subject.sort).to eq(expected)
    end
  end
end
