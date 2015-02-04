class LendersController < ApplicationController
    respond_to :html

  # GET /lenders
  # GET /lenders.json
  def index
    @lenders = Lender.all
    respond_with(@lenders)
  end

  # GET /lenders/1
  # GET /lenders/1.json
  def show
    respond_with(@lender)
  end

  # GET /lenders/new
  def new
    @lender = Lender.new
  end

  # GET /lenders/1/edit
  def edit
  end

  # POST /lenders
  # POST /lenders.json
  def create
    @lender = Lender.new(lender_params)
    respond_with(@lender)
  end

  # PATCH/PUT /lenders/1
  # PATCH/PUT /lenders/1.json
  def update
    respond_with(@lender)
  end

  # DELETE /lenders/1
  # DELETE /lenders/1.json
  def destroy
    respond_with(@lender)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def lender_params
      params.require(:lender).permit(:title, :account, :active)
    end
end
