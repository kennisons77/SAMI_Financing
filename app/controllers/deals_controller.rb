class DealsController < ApplicationController
  respond_to :html
  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
    respond_with(@deals)
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    respond_with(@deal)
  end

  # GET /deals/new
  def new
    @deal = Deal.new
    respond_with(@borrower,@deal)

  end

  # GET /deals/1/edit
  def edit
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)
    flash[:notice] = 'Deal was successfully created.' if @deal.save
    respond_with(@deal, :location => deals_url)
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    @deal.update(deal_params)
    respond_with(@deal, :location => deals_url)
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_with(@deal)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deal
    @deal = Deal.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def deal_params
    params.require(:deal).permit(:collateral, :term, :active)
  end
end
