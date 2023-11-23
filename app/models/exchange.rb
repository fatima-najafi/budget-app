class Exchange < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'

  validates :name, presence: true, length: { maximum: 25, too_long: '%<count>s characters is the maximum allowed' }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
