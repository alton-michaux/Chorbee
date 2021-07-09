require 'rails_helper'

RSpec.describe 'Children', type: :request do
  describe 'get children_path' do
    it 'renders the index view' do
      FactoryBot.create_list(:child, 10)
      get children_path
      expect(response).to render_template(:index)
    end
  end
  describe 'get child_path' do
    it 'renders the :show template' do
      child = FactoryBot.create(:child)
      get child_path(id: child.id)
      expect(response).to render_template(:show)
    end
    it 'redirects to the index path if the child id is invalid' do
      get child_path(id: 5000)
      expect(response).to redirect_to children_path
    end
  end
  describe 'get new_child_path' do
    it 'renders the :new template' do
      get new_child_path
      expect(response).to render_template(:new)
    end
  end
  describe 'get edit_child_path' do
    it 'renders the :edit template' do
      child = FactoryBot.create(:child)
      get edit_child_path(id: child.id)
      expect(response).to render_template(:edit)
    end
  end
  describe 'post children_path with valid data' do
    it 'saves a new entry and redirects to the show path for the entry' do
      child_attributes = FactoryBot.attributes_for(:child)
      expect do
        post children_path, params: { child: child_attributes }
      end.to change(Child, :count).by(1)
      expect(response).to redirect_to child_path(id: Child.last.id)
    end
  end
  describe 'post children_path with invalid data' do
    it 'does not save a new entry or redirect' do
      child_attributes = FactoryBot.attributes_for(:child)
      child_attributes.delete(:name)
      expect do
        post children_path, params: { child: child_attributes }
      end.to_not change(Child, :count)
      expect(response).to render_template(:new)
    end
  end
  describe 'put child_path with valid data' do
    it 'updates an entry and redirects to the show path for the child' do
      child = FactoryBot.create(:child)
      child.update({ 'age' => 12 })
      child.reload
      expect do
        put child_path(id: child[:id]), params: { child: child.as_json }
      end.to_not change(Child, :count)
      expect(response).to redirect_to child_path({ id: child[:id] })
    end
  end
  describe 'put child_path with invalid data' do
    it 'does not update the child record or redirect' do
      child = FactoryBot.create(:child)
      child.update({ 'name' => '' })
      expect do
        put child_path(id: child.id), params: { child: child.as_json }
      end.to_not change(Child, :count)
      expect(response).to render_template(:edit)
    end
  end
  describe 'delete a child record' do
    it 'deletes a child record' do
      child = FactoryBot.create(:child)
      child.destroy
      expect do
        get children_path
      end.to_not change(Child, :count)
      expect(response).to render_template(:index)
    end
  end
end
