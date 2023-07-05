class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :category_payments
  has_many :categories, through: :category_payments
  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
