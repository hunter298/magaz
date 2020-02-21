class Movie < Tovar

  attr_accessor :name, :year, :director

  def initialize params
    super

    @year = params[:year]
    @director = params[:director]
    @name = params[:name]
  end

  def to_s
    puts "Movie #{@name} by #{@director}, #{@year}y., price #{@price}$, amount #{@quantity}pcs."
  end

  def self.from_file name
    current_path = File.dirname '.'
    path = current_path + '/data/movies/' + name + '.txt'

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