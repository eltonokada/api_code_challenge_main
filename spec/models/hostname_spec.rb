require 'rails_helper'

RSpec.describe Hostname, type: :model do
  # Test for validations
  describe 'validations' do
    it 'is valid with a name' do
      hostname = Hostname.new(hostname: 'example.com')
      expect(hostname).to be_valid
    end

  end

end
