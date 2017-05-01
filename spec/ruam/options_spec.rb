require 'spec_helper'

describe Ruam::Options do
  describe '.parse' do
    subject { described_class.parse(argv) }

    context 'with valid options' do
      let(:argv) { %w[--peephole-optimization --no-stack-caching --debug-level=1 sample.rb] }

      it 'returns option hash' do
        compile_options = {
          peephole_optimization: true, stack_caching: false, debug_level: 1
        }
        expect(subject).to eq({ file: 'sample.rb', compile_options: compile_options })
      end
    end
  end
end
