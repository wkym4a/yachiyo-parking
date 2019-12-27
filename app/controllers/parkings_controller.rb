class ParkingsController < ApplicationController
  #ログインしているかどうかをチェック
  before_action :authenticate_user!
  #ログインしているユーザーの駐車場情報を開こうとしているかどうかをチェック
  before_action :authenticate_users_parking!, only: [:show, :edit, :update, :destroy]

  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  # GET /parkings
  # GET /parkings.json
  def index
    @parkings = Parking.all
  end

  # GET /parkings/1
  # GET /parkings/1.json
  def show
  end

  # GET /parkings/new
  def new
    @parking = Parking.new
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings
  # POST /parkings.json
  def create
    @parking = Parking.new(parking_params)

    @parking.user_id = current_user.id

    # respond_to do |format|
      if @parking.save
        redirect_to @parking, notice: '駐車場情報の作成に成功しました。'
        # format.html { redirect_to @parking, notice: 'Parking was successfully created.' }
        # format.json { render :show, status: :created, location: @parking }
      else
        render :new
        # format.html { render :new }
        # format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /parkings/1
  # PATCH/PUT /parkings/1.json
  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to @parking, notice: 'Parking was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking }
      else
        format.html { render :edit }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.json
  def destroy
    @parking.destroy
    respond_to do |format|
      format.html { redirect_to parkings_url, notice: 'Parking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_params
      params.require(:parking).permit(:symbol, :name, :address, :lat, :lon, :price, :memo, :managing_memo, :number, :empty_number, :status)
    end


    def authenticate_users_parking!
      redirect_to err_path if not current_user.id == Parking.find(params[:id]).user_id
    end
end
