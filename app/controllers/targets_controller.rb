class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]
  before_action :set_parent, only: [:index, :create, :new, :destroy]
  
  respond_to :html


  # GET /targets
  # GET /targets.json
  def index
    if @borrower
      @targets = @borrower.targets
      respond_with(@borrower,@targets)
    eslif @deal
      @targets = @deal.targets
      respond_with(@deal,@targets)
    else
      @targets = Target.all
      respond_with(@targets)
    end
      
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
  
    def set_parent
      if params[:borrower_id]
        @borrower = Borrower.find(params[:borrower_id])                
      elsif params[:deal_id]
        @deal = Borrower.find(params[:deal_id])                
      elseif @target
        @borrower = Borrower.find(@target.borrower_id)
        @deal = Borrower.find(@target.deal_id)
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
