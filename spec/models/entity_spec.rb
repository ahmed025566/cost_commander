require 'rails_helper'

RSpec.describe Entity, type: :model do
  user = User.new(name: 'Tome', email: 'ahmedelkholy@gmail.com', password: 'asfasf')
  group = Group.new(name: 'Utilties',
            icon: 'http://localhost:3000/assets/gas-e01f85c6657a9fd76baebb9757af906fa1396a35b89231d5260659bcafafbbe0.jpegs', user:)
  entity = Entity.new(name: 'Gas', amount: 55, author: user, groups: "#{group.name}")
  it 'should be vaild' do
    expect(entity).to be_valid
  end
  it 'should have a vaild name' do
    entity.name = ''
    expect(entity).to_not be_valid
    entity.name = 'Gas'
    expect(entity).to be_valid
  end

  it 'should have accepts letters only for the name' do
    entity.name = 'Gas2'
    expect(entity).to_not be_valid
    entity.name = 'Gas'
    expect(entity).to be_valid    
  end

  it 'should accept only numbers for amount' do
    entity.amount = 'fifty five'
    expect(entity).to_not be_valid
    entity.amount = 55
    expect(entity).to be_valid    
  end
end
