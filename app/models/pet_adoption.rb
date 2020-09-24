class PetAdoption < ApplicationRecord
  belongs_to :pet
  validates_associated :pet

  validates :adopted_by, :adopted_at,  presence: true
  validate :valid_adopeted_at?

  protected

  def valid_adopeted_at?
    if !adopted_at.is_a?(Date)
      errors.add(:adopted_at, 'must be a valid date') 
    end
  end
end
