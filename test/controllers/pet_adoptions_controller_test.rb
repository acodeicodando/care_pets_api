require 'test_helper'

class PetAdoptionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @akira = pets(:akira)
  end


  test "create pet adoption with success" do
    post pet_adoptions_path, params: { pet_adoption: { adopted_by: 'Rodrigo Toledo', adopted_at: '2003-01-01', pet_id: @akira.id } }
    assert_response :success
    assert assigns(:pet_adoption).valid?
  end

  test "create pet adoption with error" do
    post pet_adoptions_path
    assert_response 422
    assert assigns(:pet_adoption).invalid?
  end
end
