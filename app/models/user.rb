class User < ActiveRecord::Base
  has_many :events, :foreign_key => 'organizer_id'


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  validates :name, :presence => true, :uniqueness => true
end
