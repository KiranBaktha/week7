class Scanner

  def scan_barcode(barcode, receipt)
    product = ScannedProduct.lookup(barcode)

    product.append_to(receipt)
    CashRegister.display(product.description)
    Audio.emit_sound(product.beep_frequency)
  end

end

class Product

  attr_accessor :beep_frequency, :description

  def Product.lookup(barcode)
    # 1. verify check digit
    # 2. look up in db
    return Product.new(database_info)
  end

  def initialize(database_info)
    @description = database_info.description
    @beep_frequency = 1000
  end

  def append_to(receipt)
    receipt.items.push(self)
  end
end
