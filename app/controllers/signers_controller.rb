class SignersController < ApplicationController
    

  # GET /signers
  # GET /signers.json
  def index
    @signers = Signer.all
  end

  # GET /signers/1
  # GET /signers/1.json
  def show
  end

  # GET /signers/new
  def new
    @signer = Signer.new
  end

  # GET /signers/1/edit
  def edit
  end

  # POST /signers
  # POST /signers.json
  def create
    @signer = Signer.new(signer_params)

    respond_to do |format|
      if @signer.save
        format.html { redirect_to @signer, notice: 'Signer was successfully created.' }
        format.json { render :show, status: :created, location: @signer }
      else
        format.html { render :new }
        format.json { render json: @signer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /signers/1
  # PATCH/PUT /signers/1.json
  def update
    respond_to do |format|
      if @signer.update(signer_params)
        format.html { redirect_to @signer, notice: 'Signer was successfully updated.' }
        format.json { render :show, status: :ok, location: @signer }
      else
        format.html { render :edit }
        format.json { render json: @signer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signers/1
  # DELETE /signers/1.json
  def destroy
    @signer.destroy
    respond_to do |format|
      format.html { redirect_to signers_url, notice: 'Signer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signer
      @signer = Signer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signer_params
      params.require(:signer).permit(:lender_id, :first, :last, :email, :active)
    end
end
