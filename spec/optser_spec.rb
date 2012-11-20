require 'spec_helper'

describe Optser do

  describe '.extract_options!' do
    let(:given_options) {
      FactoryGirl.create :random_options
    }

    it 'returns an OptSet' do
      opt_set = described_class.extract_options! []
      opt_set.should be_a_kind_of(Optser::OptSet)
    end

    it 'returns an OptSet with our option set' do
      opt_set = described_class.extract_options! [
        given_options
      ]
      opt_set.should be_a_kind_of(Optser::OptSet)
      opt_set.get(:option_a).should == given_options.option_a
      opt_set.get(:option_b).should == given_options.option_b
      opt_set.get(:nonexist, 'DEFAULT').should == 'DEFAULT'
    end

    it 'pops off the options hash' do
      arguments = [1, 2, 3, 4, given_options]
      original_size = arguments.size
      described_class.extract_options! arguments
      arguments.size.should == (original_size - 1)
    end

    it 'does not modify arguments w/o a trailing hash' do
      arguments = [1, 2, 3, 4].freeze
      original_size = arguments.size
      described_class.extract_options! arguments
      arguments.size.should == original_size
    end

  end

end
