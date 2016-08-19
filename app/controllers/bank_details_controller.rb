class BankDetailsController < ApplicationController
  before_action :set_bank_detail, only: [:show, :edit, :update, :destroy]

  # GET /bank_details
  # GET /bank_details.json
  def index
    @bank_details = BankDetail.all
  end

  # GET /bank_details/1
  # GET /bank_details/1.json
  def show
  end

  # GET /bank_details/new
  def new
    @bank_detail = BankDetail.new
  end

  # GET /bank_details/1/edit
  def edit
  end

  # POST /bank_details
  # POST /bank_details.json
  def create
    @bank_detail = BankDetail.new(bank_detail_params)

    respond_to do |format|
      if @bank_detail.save
        format.html { redirect_to @bank_detail, notice: 'Bank detail was successfully created.' }
        format.json { render :show, status: :created, location: @bank_detail }
      else
        format.html { render :new }
        format.json { render json: @bank_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_details/1
  # PATCH/PUT /bank_details/1.json
  def update
    respond_to do |format|
      if @bank_detail.update(bank_detail_params)
        format.html { redirect_to @bank_detail, notice: 'Bank detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_detail }
      else
        format.html { render :edit }
        format.json { render json: @bank_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_details/1
  # DELETE /bank_details/1.json
  def destroy
    @bank_detail.destroy
    respond_to do |format|
      format.html { redirect_to bank_details_url, notice: 'Bank detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_detail
      @bank_detail = BankDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_detail_params
      params.require(:bank_detail).permit(:user_id, :account_no, :bank_name)
    end
end
