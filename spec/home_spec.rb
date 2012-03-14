require 'spec_helper'

describe 'home page' do
  it 'welcomes the user' do
    'root_url'.should have_content('Home')
  end
end
 
