require 'spec_helper'

describe Optser do

  describe '.extract_options' do
    let(:given_options) {
      FactoryGirl.create :random_options
    }
    let(:given_args) {
      [ given_options ]
    }
    it 'returns an OptSet without popping off arguments' do
      expect(given_args.size).to eq(1)
      opt_set = described_class.extract_options given_args
      expect(opt_set).to be_a_kind_of(Optser::OptSet)
      expect(opt_set.get(:option_a)).to eq(given_options.option_a)
      expect(opt_set.get(:option_b)).to eq(given_options.option_b)
      expect(opt_set.get(:nonexist, 'DEFAULT')).to eq('DEFAULT')
      # Make sure it didn't pop off the args list
      expect(given_args.size).to eq(1)
    end
  end

  describe '.extract_options!' do
    let(:given_options) {
      FactoryGirl.create :random_options
    }

    it 'returns an OptSet' do
      opt_set = described_class.extract_options! []
      expect(opt_set).to be_a_kind_of(Optser::OptSet)
    end

    it 'returns an OptSet with our option set' do
      opt_set = described_class.extract_options! [
        given_options
      ]
      expect(opt_set).to be_a_kind_of(Optser::OptSet)
      expect(opt_set.get(:option_a)).to eq(given_options.option_a)
      expect(opt_set.get(:option_b)).to eq(given_options.option_b)
      expect(opt_set.get(:nonexist, 'DEFAULT')).to eq('DEFAULT')
    end

    it 'pops off the options hash' do
      arguments = [1, 2, 3, 4, given_options]
      original_size = arguments.size
      described_class.extract_options! arguments
      expect(arguments.size).to eq(original_size - 1)
    end

    it 'does not modify arguments w/o a trailing hash' do
      arguments = [1, 2, 3, 4].freeze
      original_size = arguments.size
      described_class.extract_options! arguments
      expect(arguments.size).to eq(original_size)
    end
  end

  describe '.parse_options' do
    let(:given_options) {
      FactoryGirl.create :random_options
    }
    it 'returns an OptSet w/ options' do
      opt_set = described_class.parse_options given_options
      expect(opt_set).to be_a_kind_of(Optser::OptSet)
      expect(opt_set.get(:option_a)).to eq(given_options.option_a)
      expect(opt_set.get(:option_b)).to eq(given_options.option_b)
      expect(opt_set.get(:nonexist, 'DEFAULT')).to eq('DEFAULT')
    end
  end

end
