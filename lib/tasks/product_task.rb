class Tasks::Product_task
  def self.set_time_sale
    Product.update_all("price =  price * 0.9")
  end

  def self.end_time_sale
    Product.update_all("price =  price / 0.9")
  end
end