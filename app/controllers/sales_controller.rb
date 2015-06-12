class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all.includes(:client).order('clients.name')
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    if params[:c]
      @products = Product.where("name LIKE '%#{params[:c]}%'").select("distinct products.* ")
    else
      @products = Product.all
    end
    @offers = Offer.where(sale_id: @sale.id)
    @price = 0
    @offers.each do |offer|
      @price += offer.price * offer.amount
    end
    @sale.update({total_price: @price})
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  def new_retail_sale
    @clients = Client.all
    @sale = Sale.new
  end

  def new_whole_sale
    @clients = Client.all
    @sale = Sale.new
  end

  def end_sale
    sale = Sale.find(params[:id])
    sale.offers.each do |offer|
      current_amount = Product.find(offer.product_id).amount
      Product.find(offer.product_id).update(amount: (current_amount - offer.amount))
    end
    sale.update({finished: true})
    redirect_to sales_path
  end

  #post
  def retail_sale
    @sale = Sale.new
    @sale.type_name = 'retail'
    if Client.where(nit: params[:client_id]).count > 0
      @sale.client_id = Client.where(nit: params[:client_id]).first.id
      @sale.finished = false
      @sale.save
      redirect_to @sale
    else
      redirect_to new_client_path
    end
  end

  #post
  def whole_sale
    @sale = Sale.new
    @sale.type_name = 'whole sale'
    if Client.where(nit: params[:client_id]).count > 0
      @sale.client_id = Client.where(nit: params[:client_id]).first.id
      @sale.finished = false
      @sale.save
      redirect_to @sale
    else
      redirect_to new_client_path
    end
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:client_id, :type_name, :total_price)
    end
end
