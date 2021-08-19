# frozen_string_literal: true

module Parents
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: %i[index create new]

    # GET /resource/sign_in

    # POST /resource/sign_in

    def create
      @session = Session.new(configure_sign_in_params)

      respond_to do |format|
        if @session.save
          format.html { redirect_to @session, notice: 'Session was successfully created.' }
          format.json { render :show, status: :created, location: parent_session_url }
        else
          pp "save error: #{@session.errors.to_a} \n error on: #{@session.as_json}"
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @session.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /resource/sign_out
    def destroy
      @session.destroy

      respond_to do |format|
        format.html { redirect_to new_parent_session_url, notice: 'Session was successfully terminated.' }
        format.json { head :no_content }
      end
    end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
end
