class Product
  attr_reader :title, :price, :stock

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
    if @stock > 0
      return true
    else
      return false
    end
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

