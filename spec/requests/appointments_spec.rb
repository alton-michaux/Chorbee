require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  describe 'get appointments_path' do
    it 'renders the index view' do
      FactoryBot.create_list(:appointment, 10)
      get appointments_path
      expect(response).to render_template(:index)
    end
  end
  describe 'get appointment_path' do
    it 'renders the :show template' do
      appointment = FactoryBot.create(:appointment)
      get appointment_path(id: appointment.id)
      expect(response).to render_template(:show)
    end
    it 'redirects to the index path if the appointment id is invalid' do
      get appointment_path(id: 5000)
      expect(response).to redirect_to appointments_path
    end
  end
  describe 'get new_appointment_path' do
    it 'renders the :new template' do
      get new_appointment_path
      expect(response).to render_template(:new)
    end
  end
  describe 'get edit_appointment_path' do
    it 'renders the :edit template' do
      appointment = FactoryBot.create(:appointment)
      get edit_appointment_path(id: appointment.id)
      expect(response).to render_template(:edit)
    end
  end
  describe 'post appointments_path with valid data' do
    it 'saves a new entry and redirects to the show path for the entry' do
      appointment_attributes = FactoryBot.attributes_for(:appointment)
      expect { post appointments_path, params: { appointment: appointment_attributes.as_json } }.to change(Appointment, :count).by(1)
      expect(response).to redirect_to appointment_path(id: appointment.last.id)
    end
  end
  describe 'post appointments_path with invalid data' do
    it 'does not save a new entry or redirect' do
      appointment_attributes = FactoryBot.attributes_for(:appointment)
      appointment_attributes.delete(:job)
      expect do
        post appointments_path, params: { appointment: appointment_attributes }
      end.to_not change(Appointment, :count)
      expect(response).to render_template(:new)
    end
  end
  describe 'put appointment_path with valid data' do
    it 'updates an entry and redirects to the show path for the appointment' do
      appointment = FactoryBot.create(:appointment)
      appointment.update({ 'frequency' => 'Weekly' })
      appointment.reload
      expect do
        put appointment_path(id: appointment[:id]), params: { appointment: appointment.as_json }
      end.to_not change(Appointment, :count)
      expect(response).to redirect_to appointment_path({ id: appointment[:id] })
    end
  end
  describe 'put appointment_path with invalid data' do
    it 'does not update the appointment record or redirect' do
      appointment = FactoryBot.create(:appointment)
      appointment.update({ 'frequency' => ' ' })
      expect do
        put appointment_path(id: appointment.id), params: { appointment: appointment.as_json }
      end.to_not change(Appointment, :count)
      expect(response).to render_template(:edit)
    end
  end
  describe 'delete a appointment record' do
    it 'deletes a appointment record' do
      appointment = FactoryBot.create(:appointment)
      appointment.destroy
      expect do
        get appointments_path
      end.to_not change(Appointment, :count)
      expect(response).to render_template(:index)
    end
  end
end
