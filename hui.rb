require 'rexml/document'
require_relative 'tovar'
require_relative 'book'
require_relative 'movie'

class Get_collection

  def initialize collection=[]
    @collection = collection
  end

  def self.read_xml
    current_path =  File.dirname __FILE__

    file_path = current_path + '/products.xml'

    file = File.new file_path, "r:UTF-8"

    doc = REXML::Document.new file
    hui = []


    doc.elements.each("products/books/book") do |item|
      hui << Book.new(
          {:quantity => item.attributes["amount"],
           :price => item.attributes["price"],
           :author => item.attributes["author"],
           :genre => item.attributes["genre"],
           :name => item.text}
      )
    end

    doc.elements.each("products/movies/movie") do |item|
      hui << Movie.new(
          {:quantity => item.attributes["amount"],
           :price => item.attributes["price"],
           :director => item.attributes["director"],
           :year => item.attributes["year"],
           :name => item.text}
      )
    end

    return hui
  end

end

