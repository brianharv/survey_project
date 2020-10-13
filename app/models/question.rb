class Question < ApplicationRecord
  belongs_to :survey
  validates :body, presence: true
end  