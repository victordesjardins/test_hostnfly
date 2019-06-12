class Api::V1::ReservationsController < Api::V1::BaseController
  before_action :set_reservation, only: [ :show, :update, :destroy ]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @reservation.update(reservation_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @reservation.destroy
    head :no_content
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:listing_id, :start_date, :end_date)
  end

  def render_error
    render json: { errors: @reservation.errors.full_messages },
      status: :unprocessable_entity
  end
end
