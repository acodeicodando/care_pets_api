require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @akira        = pets(:akira)
    @funny_cat    = pets(:funny_cat)
    @new_pet      = Pet.new
  end

  test "get root" do
    get root_path
    assert_response :success
    assert_equal assigns(:pets).count, 4
  end

  test "get index" do
    get pets_path
    assert_response :success
    assert_equal assigns(:pets).count, 4
  end

  test "get info about akira pet" do
    get pet_path(@akira)
    assert_response :success
    assert_not_nil assigns(:pet)
  end

  test "create pet with success" do
    post pets_path, params: { pet: { name: 'Nina', date_of_birth: '2001-01-01', pet_type: 'cat' } }
    assert_response :success
    assert assigns(:pet).valid?
  end

  test "create pet with error" do
    post pets_path
    assert_response 422
    assert assigns(:pet).invalid?
  end

  test "edit pet with success" do
    put pet_path(@akira), params: { pet: { name: 'Akira Edited', date_of_birth: '2001-01-02', pet_type: 'dog' } }
    assert_response :success
    assert assigns(:pet).valid?
    assert_equal assigns(:pet).name, 'Akira Edited'
  end

  test "edit pet with error" do
    put pet_path(@akira), params: { pet: { name: '' } }
    assert_response 422
    assert assigns(:pet).invalid?
  end
end
