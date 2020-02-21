require_relative 'tovar'
require_relative 'book'
require_relative 'movie'
require_relative 'product_collection'

collect1 = ProductCollection.from_dir(File.dirname(__FILE__) + '/data/')
puts collect1.sort!(by: :name, order: :asc)