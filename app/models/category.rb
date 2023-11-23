class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :exchanges, class_name: 'Exchange', foreign_key: 'category_id'

  validates :name, presence: true, length: { maximum: 25, too_long: '%<count>s charecters is the maximum allowed' }
  validates :icon, presence: true

  def total_amount
    total = 0
    exchanges.each do |exchange|
      total += exchange.amount.to_i
    end
    total
  end
end
