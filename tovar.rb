class Tovar

  def initialize params
    @price = params[:price]
    @quantity = params[:quantity]
  end

  attr_accessor :quantity, :price

  def to_s
    puts "Цена #{@price}$, amount: #{@quantity} pcs."
  end

  def self.from_file argument
    raise "NotImplementedError"
  end

end