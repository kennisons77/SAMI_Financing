class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  respond_to :html

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
    respond_with(@trades)    
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    respond_with(@trade)    
  end

  # GET /trades/new
  def new
    @trade = Trade.new
    respond_with(@target,@trade)
    
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = @target.trades.new(trade_params)
    @trade.save
    respond_with(@target,@trade, :location => target_trades_url(@target))
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_with(@target,@trade, :location => target_trades_url(@target))
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_with(@target,@trade)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:trade_date, :settlement_date, :buy, :cusip, :pool, :coupon, :original_face, :current_face, :factor, :price, :market_value, :interest, :total_mv_wac, :margin_mv, :cash, :target_id)
    end
end
