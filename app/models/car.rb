class Car < ActiveRecord::Base
  validates :brand, presence: true
  validates :reg_number, presence: true
  validates :user, presence: true
  belongs_to :user
  has_many :mileages

end
