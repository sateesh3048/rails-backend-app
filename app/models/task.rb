class Task < ApplicationRecord
  belongs_to :user
  #Validations
  validates :title, presence: true, uniqueness: true
end
