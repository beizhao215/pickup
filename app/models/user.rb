# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#  newbie          :boolean
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :newbie, :qq, :phone, :renren, :gender, 
                  :provide_housing, :housing_number, :available_pickup_time, :major
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :trips, foreign_key: "volunteer_id", dependent: :destroy
  has_many :pickedposts, through: :trips, source: :pickedpost
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum:50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:  { case_sensitive:false }
  validate :validate_password
  validates_inclusion_of :newbie, :in => [true, false]
  
  def validate_password
    if new_record? 
      password.length >= 6
      password_confirmation==password
    end
  end
  
  def picking?(post)
    trips.find_by_pickedpost_id(post.id)
  end
  
  def pick!(post)
    trips.create!(pickedpost_id: post.id)
  end
  
  def unpick!(post)
    trips.find_by_pickedpost_id(post.id).destroy
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
