class AgreementsController < ApplicationController
    respond_to :html

  def allocation_report
    
  end

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
  end

  # GET /agreements/1/edit
  def edit
 end

  # POST /agreements
  # POST /agreements.json
  def create
    @agreement = Agreement.new(agreement_params)
    respond_with(@agreement)
  end

  # PATCH/PUT /agreements/1
  # PATCH/PUT /agreements/1.json
  def update
    respond_with(@agreement)
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
