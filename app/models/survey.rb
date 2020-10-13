class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :topic, presence: true
  before_save(:titleize_survey)

  private
  def titleize(user_input)
    input_array = []
    user_input = user_input.split(' ')
    user_input.each do |word|
      input_array.push((word.capitalize))
    end
    input_array.join(' ')  
  end    

  def titleize_survey
    self.topic = self.topic.titleize
  end  
end  