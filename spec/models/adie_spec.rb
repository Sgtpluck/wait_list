require 'spec_helper'

describe Adie do
  describe "validations" do
      let(:adie){
        Adie.new(
          name: 'adie',
          password: 'password',
          password_confirmation: 'password',
          email: 'adie@adie.com')}
    it 'should have a name' do
      
    end
  end
end


 # validates :name, presence: true, uniqueness: { case_sensitive: false }
 #  has_many :problems #but a dude ain't one
 #  mount_uploader :adatar, AdatarUploader
