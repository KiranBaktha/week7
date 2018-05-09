# Demo of the Iterator, Visitor, and Generator patterns.
require 'json'

class Product
  attr_accessor :sku, :price, :title, :description, :in_stock

  def to_s
    "#{title}\n#{'-' * title.length}\n  SKU: #{sku}\n  PRICE: #{price}\n  IN STOCK? #{in_stock}\n  DESC: #{description}\n\n"
  end

  def Product.all
    JSON.parse(IO.read('./products.json')).map do |info|
      p = Product.new
      p.sku = info['ASIN']
      p.price = info['price']
      p.title = info['title']
      p.description = info['description']
      p.in_stock = info['InStock']
      p
    end
  end
end

puts Product.all
