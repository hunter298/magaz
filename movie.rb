class Movie < Tovar

  attr_accessor :name, :year, :director

  def initialize params
    super

    @year = params[:year]
    @director = params[:director]
    @name = params[:name]
  end

  def to_s
   "Movie #{@name.strip} by #{@director}, #{@year}y., price #{@price}$, amount #{@quantity}pcs."
  end

  def self.from_file path
    file = File.new path
    arr = file.readlines
    file.close
    return self.new(
        :name => arr[0].chomp,
        :director => arr[1].chomp,
        :year => arr[2].chomp,
        :price => arr[3].chomp,
        :quantity => arr[4].chomp)
  end


end