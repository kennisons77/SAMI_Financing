class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]
  before_action :set_borrower, only: [:index, :create, :new, :destroy]
  before_action :get_deals_dropdown, only: [:new, :edit]
  
  respond_to :html


  # GET /targets
  # GET /targets.json
  def index
    @targets = @borrower.targets
    respond_with(@borrower,@targets)
  end

  # GET /targets/1
  # GET /targets/1.json
  def show
    respond_with(@target)
  end

  # GET /targets/new
  def new
    @target = @borrower.targets.build
    respond_with(@borrower,@target)
  end

  # GET /targets/1/edit
  def edit
  end

  # POST /targets
  # POST /targets.json
  def create
    @target = @borrower.targets.new(target_params)
    flash[:notice] = 'Target was successfully created.' if @target.save   
    respond_with(@borrower, @target, :location => borrower_targets_url(@borrower))
  end

  # PATCH/PUT /targets/1
  # PATCH/PUT /targets/1.json
  def update
      @target.update(target_params)
      flash[:notice] = 'Target was successfully updated.' if @target.save
      respond_with(@target, :location => borrower_targets_url(@target.borrower_id))
  end

  # DELETE /targets/1
  # DELETE /targets/1.json
  def destroy
    @target.destroy
    respond_with(@borrower,@target, :location => borrower_targets_url(@borrower))
  end

  private
    def get_deals_dropdown
        @deals = Deal.active    
    end
  
    def set_borrower
      if @target
        @borrower = Borrower.find(@target.borrower_id)
      else
        @borrower = Borrower.find(params[:borrower_id])        
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_target
      @target = Target.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def target_params
      params.require(:target).permit(:amount, :yield, :borrower_id, :deal_id)
    end
end
