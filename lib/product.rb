class Product
  attr_accessor :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title_name)
    @@products.find {|product| product.title == title_name}
  end

  def in_stock?
    @stock > 0
  end

  def self.in_stock
    items_in_stock = []
    @@products.each do |product|
      if product.in_stock?
        items_in_stock << product
      end
    end
    items_in_stock.each do |item|
      puts "#{item.title}"
    end
  end


  def take_one_stock_away_after_purchase
    @stock -= 1
  end

  private

   def add_to_products
    unique_name = @@products.map {|product| product.title}
    if !unique_name.include? self.title
      @@products << self
    else
      raise DuplicateProductError, "#{self.title} already exists"
    end
  end
end

