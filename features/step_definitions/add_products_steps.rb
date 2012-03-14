Given /^I have products titled Chocolate, Selection$/ do
    Product.create!(:title=>"Chocolate Box", :description=>"xyz", :image_url=>"xyz.gif", :price=>"10.99")
    Product.create!(:title=>"Selection Box", :description=>"xyz", :image_url=>"xyz.gif", :price=>"10.99")
end

When /^I go to the products page$/ do
    products_path
end

Then /^I should see "Chocolate"$/ do
    Product.should include ("Chocolate Box")
end
