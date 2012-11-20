require 'spec_helper'

shared_examples 'default getter method' do

  it 'returns default data' do
    subject.get(:nonexistent_option, 'DEFAULT').should == 'DEFAULT'
  end

  it 'returns nil data on no default' do
    subject.get(:nonexistent_option).should be_nil
  end

  it 'returns block data' do
    calculator = double('calculator')
    calculator.should_receive(:calculate).and_return('DEFAULT')
    subject.get(:nonexistent_option) {
      calculator.calculate
    }.should == 'DEFAULT'
  end

end

describe Optser::OptSet do
  let(:given_options) {
    FactoryGirl.create :random_options
  }
  subject { described_class.new given_options }

  describe '#get' do
    it_behaves_like 'default getter method'
  end

  describe '#get!' do
    it_behaves_like 'default getter method'

    it 'returns given data' do
      subject.get!(:option_a).should == given_options.option_a
    end

    it 'fails for missing option' do
      expect {
        subject.get! :nonexistent_option
      }.to raise_error
    end

  end

end
