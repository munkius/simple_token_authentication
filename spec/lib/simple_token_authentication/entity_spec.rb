require 'spec_helper'

describe SimpleTokenAuthentication::Entity do

  before(:each) do
    user = double()
    user.stub(:name).and_return('SuperUser')
    stub_const('SuperUser', user)

    @subject = SimpleTokenAuthentication::Entity.new(SuperUser)
  end

  it 'responds to :model', protected: true do
    expect(@subject).to respond_to :model
  end

  it 'responds to :name', protected: true do
    expect(@subject).to respond_to :name
  end

  it 'responds to :name_underscore', protected: true do
    expect(@subject).to respond_to :name_underscore
  end

  describe '#model' do
    it 'is a constant', protected: true do
      expect(@subject.model).to eq SuperUser
    end
  end

  describe '#name' do
    it 'is a camelized String', protected: true do
      expect(@subject.name).to be_instance_of String
      expect(@subject.name).to eq @subject.name.camelize
    end
  end

  describe '#name_underscore', protected: true do
    it 'is an underscored String' do
      expect(@subject.name_underscore).to be_instance_of String
      expect(@subject.name_underscore).to eq @subject.name_underscore.underscore
    end
  end
end
