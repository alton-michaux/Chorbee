require 'rails_helper'

RSpec.describe 'Children', type: :request do
  # let(:valid_session) { {} }
  subject { FactoryBot.create(:parent) }

  describe 'get children_path' do
    it 'renders the index view' do
      sign_in subject
      FactoryBot.create_list(:child, 10)
      get children_path
      expect(response).to render_template(:index)
      sign_out subject
    end
  end
  describe 'get child_path' do
    it 'renders the :show template' do
      sign_in subject
      child = FactoryBot.create(:child)
      get child_path(id: child.id)
      expect(response).to render_template(:show)
      sign_out subject
    end
    it 'redirects to the index path if the child id is invalid' do
      sign_in subject
      get child_path(id: 5000)
      expect(response).to redirect_to children_path
      sign_out subject
    end
  end
  describe 'get new_child_path' do
    it 'renders the :new template' do
      sign_in subject
      get new_child_path
      expect(response).to render_template(:new)
      sign_out subject
    end
  end
  describe 'get edit_child_path' do
    it 'renders the :edit template' do
      sign_in subject
      child = FactoryBot.create(:child)
      get edit_child_path(id: child.id)
      expect(response).to render_template(:edit)
      sign_out subject
    end
  end
  describe 'post children_path with valid data' do
    it 'saves a new entry and redirects to the show path for the entry' do
      sign_in subject
      child_attributes = FactoryBot.attributes_for(:child)
      expect { post children_path, params: { child: child_attributes } }.to change(Child, :count).by(1)
      expect(response).to redirect_to child_path(id: Child.last.id)
      sign_out subject
    end
  end
  describe 'post children_path with invalid data' do
    it 'does not save a new entry or redirect' do
      sign_in subject
      child_attributes = FactoryBot.attributes_for(:child)
      child_attributes.delete(:name)
      expect do
        post children_path, params: { child: child_attributes }
      end.to_not change(Child, :count)
      expect(response).to render_template(:new)
      sign_out subject
    end
  end
  describe 'put child_path with valid data' do
    it 'updates an entry and redirects to the show path for the child' do
      sign_in subject
      child = FactoryBot.create(:child)
      child.update({ 'age' => 12 })
      child.reload
      expect do
        put child_path(id: child[:id]), params: { child: child.as_json }
      end.to_not change(Child, :count)
      expect(response).to redirect_to child_path({ id: child[:id] })
      sign_out subject
    end
  end
  describe 'put child_path with invalid data' do
    it 'does not update the child record or redirect' do
      sign_in subject
      child = FactoryBot.create(:child)
      child.update({ 'name' => '' })
      expect do
        put child_path(id: child.id), params: { child: child.as_json }
      end.to_not change(Child, :count)
      expect(response).to render_template(:edit)
      sign_out subject
    end
  end
  describe 'delete a child record' do
    it 'deletes a child record' do
      sign_in subject
      child = FactoryBot.create(:child)
      child.destroy
      expect do
        get children_path
      end.to_not change(Child, :count)
      expect(response).to render_template(:index)
      sign_out subject
    end
  end
end
