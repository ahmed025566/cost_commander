require 'rails_helper'

RSpec.describe Group, type: :model do
  user = User.new(name: 'Tome', email: 'ahmedelkholy@gmail.com', password: 'asfasf')
  group = Group.new(name: 'Utilties',
                    icon: 'http://localhost:3000/assets/gas-e01f85c6657a9fd76baebb9757af906fa1396a35b89231d5260659bcafafbbe0.jpegs',
                    user:)
  it 'should be a valid one' do
    expect(group).to be_valid
  end

  it 'it should have a name' do
    group.name = ''
    expect(group).to_not be_valid
    group.name = 'Utilties'
    expect(group).to be_valid
  end

  it 'should have a user' do
    group.user = nil
    expect(group).to_not be_valid
    group.user = user
    expect(group).to be_valid
  end
end
