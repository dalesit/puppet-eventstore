require 'spec_helper'
describe 'eventstore' do

  context 'with defaults for all parameters' do
    it { should contain_class('eventstore') }
  end
end
