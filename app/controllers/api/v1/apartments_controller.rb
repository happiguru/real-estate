class Api::V1::ApartmentsController < ActionController::API
  def index
    @apartments = Apartment.all

    render json: @apartments
  end

  def show
    @apartment = Apartment.find(params[:id])
    return render json: @apartment, status: :ok if @apartment
  end

  def create
    @apartments = Apartment.create!(apartment_params)
    render json: @apartment, status: :created
  end

  private

  def apartment_params
    params.permit(:apartment_name, :city, :address, :description_short, :price)
  end
end
