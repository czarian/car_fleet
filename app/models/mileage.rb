class Mileage < ActiveRecord::Base

  validates :value, presence: true, numericality: {only_float: true}
  validates :car, presence: true
  validates :user, presence: true
  validates_uniqueness_of :month, :scope => :year, :message => "this month is already in use", presence: true
  belongs_to :car
  belongs_to :user
end
