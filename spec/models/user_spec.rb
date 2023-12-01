require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Tome', email: 'ahmedelkholy@gmail.com', password: 'asfasf')

  it 'should be valid if it is has a name' do
    expect(user).to be_valid
  end

  it 'should not be vaild if it does not have a name' do
    user.name = ''
    expect(user).to_not be_valid
    user.name = 'Tome'
    expect(user).to be_valid
  end

  it 'should not be vaild if the user input a non letter' do
    user.name = 'Tome2'
    expect(user).to_not be_valid
    user.name = 'Tome'
    expect(user).to be_valid
  end
end
