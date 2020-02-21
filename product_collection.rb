class ProductCollection

  def initialize collection = []

    @collection = collection

  end

  PRODUCT_TYPES = {
      movie: {dir: 'movies', class: Movie},
      book: {dir: 'books', class: Book}

  }

  def self.from_dir directory

    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[directory + "/" + product_dir + "/*.txt"].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new products
  end

  def to_a
    @collection
  end

  def sort!(params)

    case params[:by]
    when :name
      @collection.to_a.sort_by! {|item| item.name}
    when :price
      @collection.to_a.sort_by! {|item| item.price.to_f}
    end

    if params[:order] == :asc
      @collection.reverse!
    end

    return @collection

  end

end