require 'test_helper'

class PetAdoptionTest < ActiveSupport::TestCase

  def setup
    @pet_adoption_akira   = pet_adoptions(:pet_adoption_akira)
    @pet_adoption_invalid = PetAdoption.new
  end

  test 'valid pet adoption' do
    assert @pet_adoption_akira.valid?
  end

  test 'invalid without adopted_by' do
    refute @pet_adoption_invalid.valid?, 'cant save pet adoption without an adopted by'
    assert_not_empty @pet_adoption_invalid.errors[:adopted_by], 'no validation error for adopted by present'
  end

  test 'invalid without adopted_at' do
    refute @pet_adoption_invalid.valid?, 'cant save pet adoption without an adopted date'
    assert_not_empty @pet_adoption_invalid.errors[:adopted_at], 'no validation error for adopted date present'
    assert_equal @pet_adoption_invalid.errors[:adopted_at].count, 2
  end
end
