require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Example User', email: 'user@example.com',
      password: 'foobar', password_confirmation: 'foobar')
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'is invalid without name' do
    @user.name = ' '
    expect(@user).not_to be_valid
  end

  it 'is invalid without email' do
    @user.email = ' '
    expect(@user).not_to be_valid
  end

  it 'is invalid with too long name' do
    @user.name = 'a' * 51
    expect(@user).not_to be_valid
  end

  it 'is invalid with too long email' do
    @user.email =  'a' * 244 + '@example.com'
    expect(@user).not_to be_valid
  end

  it 'is valid with correct format email' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |m|
      @user.email = m
      expect(@user).to be_valid
    end
  end

  it 'is invalid with incorrect format email' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |m|
      @user.email = m
      expect(@user).not_to be_valid
    end
  end

  it 'is invalid with duplicate email' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).not_to be_valid
  end

  it 'is invalid with blank password' do
    @user.password = @user.password_confirmation = ' ' * 6
    expect(@user).not_to be_valid
  end

  it 'is invalid with too short password' do
    @user.password = @user.password_confirmation = 'a' * 5
    expect(@user).not_to be_valid
  end
end
