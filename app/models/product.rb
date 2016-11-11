class Product < ActiveRecord::Base
  has_many :ordered_products
  has_many :orders, :through => :ordered_products

  def self.inventory_status(id)
    product = Product.find(id)
    (product && product.inventory > 0) ? true : false
  end
end
