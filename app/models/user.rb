class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id'
  has_many :exchanges, foreign_key: 'author_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
                   length: { maximum: 30, too_long: '%<count>s charecters is the maximum allowed' }
end
