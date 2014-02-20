require 'spec_helper'

describe Adie do
  describe "validations" do
      let(:adie) { Adie.new(name: "Davida", 
                            adatar: "some_url", 
                            password: "1234", 
                            password_confirmation: "1234",
                            ta: false,
                            admin: false) }
  
    it 'is valid' do
      expect(adie).to be_valid
    end

    it 'must have name' do
      adie.name = nil
      expect(adie).to_not be_valid
    end
  end

end
