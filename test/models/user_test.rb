require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:jill).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end


  test "a user can have a correctly formatted profile name" do
    user = User.new(id: 0, first_name: 'Jill', last_name: 'Farnsworth',
      email: 'jill@yahoo.com')
    user.password = 'password'
    user.profile_name = 'jillfarns_1'
    assert user.valid?
  end

end
