# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  note       :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Post < ActiveRecord::Base
  attr_accessible :note, :number_of_people, :arrival_date, :arrival_time, :flight_number, :luggage_number, :destination, :entry_port,
                  :need_housing, :need_pickup
  belongs_to :user
  has_many :reverse_trips, foreign_key: "pickedpost_id", class_name: "Trip", dependent: :destroy
  has_many :volunteers, through: :reverse_trips, source: :volunteer 
  
  validates :user_id, presence: true
  validates :note, length: { maximum: 140 }
  validates :number_of_people, presence: true
  validates_numericality_of :number_of_people, :only_integer => true
  VALID_DATE_REGEX = /\d\d\d\d+\-\d\d+\-\d\d/
  validates :arrival_date, presence: true, format: { with: VALID_DATE_REGEX }
  VALID_TIME_REGEX = /\d\d+:\d\d+:\d\d/
  validates :arrival_time, presence: true, format: { with: VALID_TIME_REGEX }
  validates :flight_number, presence: true
  validates :need_pickup, presence: true
  validates :need_housing, presence: true
  
  default_scope order: 'posts.created_at DESC'
end
