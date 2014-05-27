class User < ActiveRecord::Base
  has_many :photos
  has_many :favorites
  has_many :favorite_photos, :through => :favorites, :source => :photo
  belongs_to
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
