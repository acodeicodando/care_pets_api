class PetAdoptionsController < ApplicationController
  def create
    @pet_adoption = PetAdoption.new(pet_adoption_params)

    if @pet_adoption.save
      render json: @pet_adoption, status: :created
    else
      render json: @pet_adoption.errors, status: :unprocessable_entity
    end
  end
  
  protected
  
  def pet_adoption_params
    return {} unless params.key?(:pet_adoption)
    params.require(:pet_adoption).permit(:pet_id, :adopted_by, :adopted_at)
  end
end
