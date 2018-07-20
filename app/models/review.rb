class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true
  validates :user, presence: true
  validates :product, presence: true

end
