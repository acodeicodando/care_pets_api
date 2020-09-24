require 'test_helper'

class PetTest < ActiveSupport::TestCase
  def setup
    @akira        = pets(:akira)
    @funny_cat    = pets(:funny_cat)
    @pet_invalid  = Pet.new
  end

  test 'valid pet' do
    assert @akira.valid?
  end

  test 'pet type' do
    assert @akira.dog?
    assert @funny_cat.cat?
  end

  test 'invalid without name' do
    refute @pet_invalid.valid?, 'saved pet without a name'
    assert_not_empty @pet_invalid.errors[:name], 'no validation error for name present'
  end

  test 'invalid without date of birth' do
    refute @pet_invalid.valid?
    assert_not_empty @pet_invalid.errors[:date_of_birth]
    assert_equal @pet_invalid.errors[:date_of_birth].count, 2
  end
  
end