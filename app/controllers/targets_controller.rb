class TargetsController < ApplicationController
  
  respond_to :html

  def allocation_report
    @agreements = @target.agreements  
 
  end

  def index
    if @borrower
      @targets = @borrower.targets
      respond_with(@borrower,@targets)
    elsif @deal
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
  
    # def set_parent
      # if params[:borrower_id]
        # @borrower = Borrower.find(params[:borrower_id])
        # add_breadcrumb "All Borrowers", 'borrowers_path'
        # add_breadcrumb @borrower.title, "borrower_path(#{@borrower.id})"
        # add_breadcrumb "Targets", "borrower_targets_path(#{@borrower.id})"
#                         
      # elsif params[:deal_id]
        # @deal = Borrower.find(params[:deal_id])
        # add_breadcrumb "All Deals", 'dealss_path'
        # add_breadcrumb @deal.title, "deal_path(#{@deal.id})"        
        # add_breadcrumb "Targets", "deal_targets_path(#{@deal.id})"
#                 
      # elsif @target
        # @borrower = Borrower.find(@target.borrower_id)
        # @deal = Borrower.find(@target.deal_id)
        # add_breadcrumb "Targets", 'targets_path()'       
      # end
    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_target
      @target = Target.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def target_params
      params.require(:target).permit(:amount, :yield, :borrower_id, :deal_id)
    end
end
