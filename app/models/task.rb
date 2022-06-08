class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments

  validates :name, :description, :due_date, presence: true
end
