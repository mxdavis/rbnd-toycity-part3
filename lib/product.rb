class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
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

