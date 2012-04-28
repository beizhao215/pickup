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
  attr_accessible :note, :number_of_people, :arrival_date, :arrival_time, :flight_number, :luggage_number, :destination
  belongs_to :user
  
  validates :user_id, presence: true
  validates :note, length: { maximum: 140 }
  validates :number_of_people, presence: true
  validates_numericality_of :number_of_people, :only_integer => true
  validates :arrival_date, presence: true
  validates :arrival_time, presence: true
  validates :flight_number, presence: true
  
  default_scope order: 'posts.created_at DESC'
end
