class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new
    @offer.product_id = params[:product_id]
    @offer.sale_id = params[:sale_id]
    # @offer.amount =
    if params[:amount].to_i > Product.find(params[:product_id]).amount
      redirect_to @offer.sale, notice: 'There is insufficient inventory of ' + @offer.product.name + ' to complete that offer.'
    else
      @offer.amount = params[:amount]
      # product = Product.find(params[:product_id])
      # current_amount = product.amount
      # product.update(amount: (current_amount+params[:amount]))

      if params[:sale_type] == 'retail'
        @offer.price = Product.find(params[:product_id]).retail_price
      else
        @offer.price = Product.find(params[:product_id]).whole_sale_price
      end
      @offer.save

      redirect_to :back
    end


    # respond_to do |format|
    #   if @offer.save
    #     format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
    #     format.json { render :show, status: :created, location: @offer }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @offer.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      # params.require(:offer).permit(:product_id, :sale_id, :amount, :sale_type)
      params.permit(:product_id, :sale_id, :amount, :sale_type)
    end
end
