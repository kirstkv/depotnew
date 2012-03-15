require 'spec_helper'

describe Product do
  it "can be instantiated" do
    Product.new.should be_an_instance_of(Product)
  end
end
