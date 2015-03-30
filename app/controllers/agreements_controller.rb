class AgreementsController < ApplicationController
    respond_to :html
    skip_before_action :set_parent, :only => :opportunities
    before_action :get_lender
  


  # GET /agreements
  # GET /agreements.json
  def index
    @agreements = Agreement.all
    respond_with(@agreements)
  end

  # GET /agreements/1
  # GET /agreements/1.json
  def show
    respond_with(@agreement)
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
    respond_with(@agreement)
  end

  # GET /agreements/1/edit
  def edit
 end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = @target.agreements.new(agreement_params)
    @agreement.save
    respond_with(@target,@agreement)
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    @agreement.update(agreement_params)
    respond_with(@target,@agreement)
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.json
  def destroy
    @agreement.destroy
    respond_with(@agreement)
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def agreement_params
      params.require(:agreement).permit(:amount, :fulfilled, :lender_id, :target_id)
    end
end
