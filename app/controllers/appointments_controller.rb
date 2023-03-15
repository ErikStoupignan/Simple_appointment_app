class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.where(user: params[:user_id])
  end

  # GET /appointments/1 or /appointments/1.json
  def show; end

  # GET /appointments/new
  def new
    @appointment = Appointment.new(user_id: params[:user_id])
  end

  # GET /appointments/1/edit
  def edit; end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = User.find(params[:user_id])

    respond_to do |format|
      if @appointment.save
        format.html do
          redirect_to user_appointment_url(@appointment.user, @appointment),
                      notice: 'Appointment was successfully created.'
        end
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html do
          redirect_to user_appointment_url(@appointment.user, @appointment),
                      notice: 'Appointment was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      # format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.html { redirect_to user_appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
    # @user = User.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:datetime)
  end
end
