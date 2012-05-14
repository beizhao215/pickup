class Trip < ActiveRecord::Base
  attr_accessible :pickedpost_id
  
  belongs_to :volunteer, class_name: "User"
  belongs_to :pickedpost, class_name: "Post"
  
  validates :volunteer_id, presence: true
  validates :pickedpost_id, presence: true
end
