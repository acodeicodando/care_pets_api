class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: @pet, status: :created, location: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @pet
  end

  protected
  def set_pet
    @pet = Pet.friendly.find(params[:id])
  end

  def pet_params
    return {} unless params.key?(:pet)
    params.require(:pet).permit(:id, :name, :date_of_birth, :pet_type)
  end
end
