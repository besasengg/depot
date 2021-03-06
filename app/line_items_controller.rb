class LineItemsController < ApplicationController
#class LineitemsController<ActiveRecord::Base64
 
  
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_lineitem, only: [:show, :edit, :update, :destroy] 

  # GET /lineitems
  # GET /lineitems.json
  def index
    @lineitems = Lineitem.all
  end

  # GET /lineitems/1
  # GET /lineitems/1.json
  def show
  end

  # GET /lineitems/new
  def new
    @lineitem = Lineitem.new
  end

  # GET /lineitems/1/edit
  def edit
  end

  # POST /lineitems
  # POST /lineitems.json
  def create
  
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(product: product)   
	

    respond_to do |format|
      if @line_item.save
        
		format.html { redirect_to @line_item.cart,
           notice: 'Line item was successfully created.'}
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lineitems/1
  # PATCH/PUT /lineitems/1.json
  def update
    respond_to do |format|
      if @lineitem.update(lineitem_params)
        format.html { redirect_to @lineitem, notice: 'Lineitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @lineitem }
      else
        format.html { render :edit }
        format.json { render json: @lineitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineitems/1
  # DELETE /lineitems/1.json
  def destroy
    @lineitem.destroy
    respond_to do |format|
      format.html { redirect_to lineitems_url, notice: 'Lineitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lineitem
      @lineitem = Lineitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lineitem_params
      params.require(:lineitem).permit(:product, :cart_id)
    end
end
