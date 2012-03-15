class InvoiceController < ApplicationController
  def index
    @cart=Cart.find(current_cart)
    @order = Order.find(1)
    @order.add_line_items_from_cart(current_cart)
    
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to("/invoice/index", :notice => 'Thank you for your order.' ) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end

  end
end
