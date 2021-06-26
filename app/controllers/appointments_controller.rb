# frozen_string_literal: true

class AppointmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  rescue_from StandardError, with: :catch_no_method
  before_action :set_appointment, only: %i[show edit update destroy]

  # GET /appointments or /appointments.json
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @appointments = Appointment.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  # GET /appointments/1 or /appointments/1.json
  def show; end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit; end

  # POST /appointments or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
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
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        pp "update error: #{@appointment.errors.to_a} \n error on: #{@appointment.as_json}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:start_time, :chore_id)
  end

  def catch_not_found(e)
    Rails.logger.debug('There was a not found exception.')
    flash.alert = e.to_s
    redirect_to appointments_url
  end

  def catch_no_method(e)
    Rails.logger.debug("There was a 'NoMethodError': #{e} (the object may have been created without all it's attributes.)")
    flash.alert = e.to_s
    redirect_to appointments_url
  end
end
