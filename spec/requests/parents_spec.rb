require 'rails_helper'

RSpec.describe 'Parents', type: :request do
  subject { FactoryBot.create(:parent) }

  describe 'if parent not signed in' do
    it 'redirects to the login page' do
      get root_path
      expect(response).to redirect_to new_parent_session_path
    end
    it 'renders the sign in view' do
      subject
      get new_parent_session_path
      expect(response).to render_template(:new)
    end
    it 'renders the sign up view' do
      parent_attributes = FactoryBot.attributes_for(:parent)
      get new_parent_registration_path, params: { parent: parent_attributes }
      expect(response).to render_template(:new)
    end
  end

  context 'if parent signed in' do
    describe 'get root_path' do
      it 'renders the dashboard view' do
        sign_in subject
        get root_path
        expect(response).to render_template('layouts/application')
        sign_out subject
      end
      it 'redirects to the new_parent_session path if the parent is invalid' do
        sign_in subject
        get parent_session_path(id: 5000)
        expect(response).to redirect_to root_path
        sign_out subject
      end
    end
    describe 'get edit_parent_registration' do
      it 'renders the :edit template' do
        sign_in parent = FactoryBot.create(:parent)
        get edit_parent_registration_path(id: parent.id)
        expect(response).to render_template(:edit)
        sign_out parent
      end
    end
  end
end
