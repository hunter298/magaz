class Book < Tovar

  def initialize params
    super

    @genre = params[:genre]
    @author = params[:author]
    @name = params[:name]
  end

  attr_accessor :name, :genre, :author

  def to_s
    puts"#{@genre.capitalize} book #{@name} by #{@author}, price: #{@price}$, amount: #{quantity} pcs."
  end

  def self.from_file name
    current_path = File.dirname '.'
    path = current_path + '/data/books/' + name + '.txt'

    file = File.new path
    arr = file.readlines
    file.close
    return self.new(
        :name => arr[0].chomp,
        :genre => arr[1].chomp,
        :author => arr[2].chomp,
        :price => arr[3].chomp,
        :quantity => arr[4].chomp)
  end

end