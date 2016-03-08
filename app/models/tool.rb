class Tool < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  
  def formatted_price
    price / 100.0
  end
end
