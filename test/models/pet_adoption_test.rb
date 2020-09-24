require 'test_helper'

class PetAdoptionTest < ActiveSupport::TestCase

  def setup
    @adoption_akira      = pet_adoptions(:adoption_akira)
    @adoption_suzy       = pet_adoptions(:adoption_suzy)
    @adoption_funny_cat  = pet_adoptions(:adoption_funny_cat)
    @adoption_invalid    = PetAdoption.new
  end

  test 'valid pet_adoption' do
    assert @adoption_akira.valid?
  end

  test 'invalid without adopted_by' do
    refute @adoption_invalid.valid?, 'saved pet without a adopted by'
    assert_not_empty @adoption_invalid.errors[:adopted_by], 'no validation error for adopted by present'
  end

  test 'invalid adopted_at' do
    refute @adoption_invalid.valid?, 'saved pet adoption without a adopted date'
    assert_not_empty @adoption_invalid.errors[:adopted_at], 'no validation error for adopted date present'
    assert_equal @adoption_invalid.errors[:adopted_at].count, 2
  end
end
