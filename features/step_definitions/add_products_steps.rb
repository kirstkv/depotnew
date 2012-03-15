Given /^I have completed the products form properly$/ do
    Product.create!(:title=>"Chocolate Box", :description=>"xyz", :image_url=>"xyz.gif", :price=>"10.99")
end

Then /^I will be directed to the products page$/ do
    products_path
end

Given /^I have inputted an a product$/ do
    Product.create!(:title=>"Chocolate Box", :description=>"xyz", :image_url=>"xyz.gif", :price=>"10.99")
end

Then /^the number of products will increase by 1$/ do
    @products.length.should==@products.length+1
end
