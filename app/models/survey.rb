class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :topic, presence: true
end  