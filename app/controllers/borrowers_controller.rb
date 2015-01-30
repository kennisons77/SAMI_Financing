class BorrowersController < InheritedResources::Base
 
    respond_to :html
  # GET /borrowers
  # GET /borrowers.json
  def index
    @borrowers = Borrower.all
    respond_with(@borrowers)
  end

  # GET /borrowers/1
  # GET /borrowers/1.json
  def show
    respond_with(@borrower)
  end

  # GET /borrowers/new
  def new
    @borrower = Borrower.new
    respond_with(@borrower)
  end

  # GET /borrowers/1/edit
  def edit
  end

  # POST /borrowers
  # POST /borrowers.json
  def create
    @borrower = Borrower.new(borrower_params)

    respond_with(@borrower, :location => borrowers_url)
  end

  # PATCH/PUT /borrowers/1
  # PATCH/PUT /borrowers/1.json
  def update
    respond_with(@borrower, :location => borrowers_url)
  end

  # DELETE /borrowers/1
  # DELETE /borrowers/1.json
  def destroy
     respond_with(@borrower)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrower
      @borrower = Borrower.find(params[:id])
    end


    def borrower_params
      params.require(:borrower).permit(:title)
    end
end

