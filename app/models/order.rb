class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_products

  validates :name, :phone_number, :total_value, :city, :neighborhood, :street, :number, presence: true

  enum status: { waiting: 0, delivered: 1 }
  before_validation :set_price
  accepts_nested_attributes_for :order_products, allow_destroy: true

  private

  def set_price
    final_price = 0
    order.order_products.each do |order_product|
      final_price += order_product.quantity * op.product.price
    end
    self.total_value = final_price + self.restaurant.delivey_tax
  end
end
