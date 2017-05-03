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

  describe '.run' do
    subject { described_class.run(argv) }

    context 'with valid options' do
      let(:argv) { %W[#{__FILE__} --peephole-optimization] }

      it 'compile given file and output the byte code' do
        insns = RubyVM::InstructionSequence.compile_file(__FILE__, peephole_optimization: true)

        expect(RubyVM::InstructionSequence).to receive(:compile_file).and_call_original
        expect { subject }.to output(insns.disasm).to_stdout
      end
    end

    context 'with unknown option' do
      let(:argv) { %W[#{__FILE__} --unknown-optimization-flag] }

      it 'output error message to stderr and nothing to stdout' do
        expect { subject }.to output(/.+/).to_stderr & output(/\A\z/).to_stdout
      end
    end

    context 'with more than one file' do
      let(:argv) { %w[foo.rb bar.rb] }

      it 'output error message to stderr and nothing to stdout' do
        expect { subject }.to output(/.+/).to_stderr & output(/\A\z/).to_stdout
      end
    end
  end
end
