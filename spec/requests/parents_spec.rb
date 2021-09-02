# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Parents', type: :request do
  include ControllerMacros
  # let(:valid_session) { {} }

  # before :each do
  #   login_parent
  # end

  describe 'get root_path' do
    context 'if parent not signed in' do
      it 'redirects to the login page' do
        get root_path
        expect(response).to redirect_to new_parent_session_path
      end
    end
    context 'when sign in is clicked' do
      it 'renders the sign in view' do
        FactoryBot.create(:parent)
        get new_parent_session_path
        expect(response).to render_template(:new)
      end
    end
    context 'when sign up is clicked' do
      it 'renders the sign up view' do
        parent_attributes = FactoryBot.attributes_for(:parent)
        get new_parent_registration_path, params: { parent: parent_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
  # describe 'get new_parent_password' do
  #   context 'renders the new password view' do
  #     # parent_attributes = FactoryBot.attributes_for(:parent)
  #     get new_parent_password_path, params: { parent: parent_attributes }
  #     expect(response).to render_template(:new)
  #   end
  # end
  # describe 'get root_path' do
  #   context 'renders the root path if parent is signed in' do
  #     get new_parent_session_path, session: valid_session
  #     expect(response).to render_template(:new)
  #   end
  #   context 'redirects to the new_parent_session path if the parent is invalid' do
  #     get root_path(id: 5000)
  #     expect(response).to redirect_to new_parent_session_path
  #   end
  # end
  # describe 'get edit_parent_registration' do
  #   it 'renders the :edit template' do
  # 		parent = FactoryBot.create(:parent)
  #     get edit_parent_registration(id: parent.id)
  #     expect(response).to render_template(:edit)
  #   end
  # end
  # describe 'get edit_child_path' do
  #   it 'renders the :edit template' do
  #     child = FactoryBot.create(:child)
  #     get edit_child_path(id: child.id)
  #     expect(response).to render_template(:edit)
  #   end
  # end
  # describe 'post children_path with valid data' do
  #   it 'saves a new entry and redirects to the show path for the entry' do
  #     child_attributes = FactoryBot.attributes_for(:child)
  #     expect { post children_path, params: { child: child_attributes } }.to change(Child, :count).by(1)
  #     expect(response).to redirect_to child_path(id: Child.last.id)
  #   end
  # end
  # describe 'post children_path with invalid data' do
  #   it 'does not save a new entry or redirect' do
  #     child_attributes = FactoryBot.attributes_for(:child)
  #     child_attributes.delete(:name)
  #     expect do
  #       post children_path, params: { child: child_attributes }
  #     end.to_not change(Child, :count)
  #     expect(response).to render_template(:new)
  #   end
  # end
  # describe 'put child_path with valid data' do
  #   it 'updates an entry and redirects to the show path for the child' do
  #     child = FactoryBot.create(:child)
  #     child.update({ 'age' => 12 })
  #     child.reload
  #     expect do
  #       put child_path(id: child[:id]), params: { child: child.as_json }
  #     end.to_not change(Child, :count)
  #     expect(response).to redirect_to child_path({ id: child[:id] })
  #   end
  # end
  # describe 'put child_path with invalid data' do
  #   it 'does not update the child record or redirect' do
  #     child = FactoryBot.create(:child)
  #     child.update({ 'name' => '' })
  #     expect do
  #       put child_path(id: child.id), params: { child: child.as_json }
  #     end.to_not change(Child, :count)
  #     expect(response).to render_template(:edit)
  #   end
  # end
  # describe 'delete a child record' do
  #   it 'deletes a child record' do
  #     child = FactoryBot.create(:child)
  #     child.destroy
  #     expect do
  #       get children_path
  #     end.to_not change(Child, :count)
  #     expect(response).to render_template(:index)
  #   end
  # end
end
