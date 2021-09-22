# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  subject { FactoryBot.create(:parent) }

  describe 'get appointments_path' do
    it 'renders the index view' do
      sign_in subject
      FactoryBot.create_list(:appointment, 10)
      get appointments_path
      expect(response).to render_template(:index)
      sign_out subject
    end
  end
  describe 'get appointment_path' do
    it 'renders the :show template' do
      sign_in subject
      appointment = FactoryBot.create(:appointment)
      get appointment_path(id: appointment.id)
      expect(response).to render_template(:show)
      sign_out subject
    end
    it 'redirects to the index path if the appointment id is invalid' do
      sign_in subject
      get appointment_path(id: 5000)
      expect(response).to redirect_to appointments_path
      sign_out subject
    end
  end
  describe 'get new_appointment_path' do
    it 'renders the :new template' do
      sign_in subject
      get new_appointment_path
      expect(response).to render_template(:new)
      sign_out subject
    end
  end
  describe 'get edit_appointment_path' do
    it 'renders the :edit template' do
      sign_in subject
      appointment = FactoryBot.create(:appointment)
      get edit_appointment_path(id: appointment.id)
      expect(response).to render_template(:edit)
      sign_out subject
    end
  end
  describe 'post appointments_path with valid data' do
    it 'saves a new entry and redirects to the show path for the entry' do
      sign_in subject
      appointment_attributes = FactoryBot.attributes_for(:appointment)
      expect do
        post appointments_path, params: { appointment: appointment_attributes.as_json }
      end.to change(Appointment, :count).by(1)
      expect(response).to redirect_to appointment_path(id: Appointment.last.id)
      sign_out subject
    end
  end
  describe 'post appointments_path with invalid data' do
    it 'does not save a new entry or redirect' do
      sign_in subject
      appointment_attributes = FactoryBot.attributes_for(:appointment)
      appointment_attributes.delete(:start_time)
      expect do
        post appointments_path, params: { appointment: appointment_attributes }
      end.to_not change(Appointment, :count)
      expect(response).to render_template(:new)
      sign_out subject
    end
  end
  describe 'put appointment_path with valid data' do
    it 'updates an entry and redirects to the show path for the appointment' do
      sign_in subject
      appointment = FactoryBot.create(:appointment)
      appointment.update({ 'frequency' => 'Weekly' })
      appointment.reload
      expect do
        put appointment_path(id: appointment[:id]), params: { appointment: appointment.as_json }
      end.to_not change(Appointment, :count)
      expect(response).to redirect_to appointment_path({ id: appointment[:id] })
      sign_out subject
    end
  end
  describe 'put appointment_path with invalid data' do
    it 'does not update the appointment record or redirect' do
      sign_in subject
      appointment = FactoryBot.create(:appointment)
      appointment.update({ 'frequency' => ' ' })
      expect do
        put appointment_path(id: appointment.id), params: { appointment: appointment.as_json }
      end.to_not change(Appointment, :count)
      expect(response).to render_template(:edit)
      sign_out subject
    end
  end
  describe 'delete a appointment record' do
    it 'deletes a appointment record' do
      sign_in subject
      appointment = FactoryBot.create(:appointment)
      appointment.destroy
      expect do
        get appointments_path
      end.to_not change(Appointment, :count)
      expect(response).to render_template(:index)
      sign_out subject
    end
  end
end
