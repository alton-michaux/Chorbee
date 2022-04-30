require 'rails_helper'

RSpec.describe 'Chores', type: :request do
  subject { FactoryBot.create(:parent) }

  describe 'get chores_path' do
    it 'renders the index view' do
      sign_in subject
      FactoryBot.create_list(:chore, 10)
      get chores_path
      expect(response).to render_template(:index)
      sign_out subject
    end
  end
  describe 'get chore_path' do
    it 'renders the :show template' do
      sign_in subject
      chore = FactoryBot.create(:chore)
      get chore_path(id: chore.id)
      expect(response).to render_template(:show)
      sign_out subject
    end
    it 'redirects to the index path if the chore id is invalid' do
      sign_in subject
      get chore_path(id: 5000)
      expect(response).to redirect_to chores_path
      sign_out subject
    end
  end
  describe 'get new_chore_path' do
    it 'renders the :new template' do
      sign_in subject
      get new_chore_path
      expect(response).to render_template(:new)
      sign_out subject
    end
  end
  describe 'get edit_chore_path' do
    it 'renders the :edit template' do
      sign_in subject
      chore = FactoryBot.create(:chore)
      get edit_chore_path(id: chore.id)
      expect(response).to render_template(:edit)
      sign_out subject
    end
  end
  describe 'post chores_path with valid data' do
    it 'saves a new entry and redirects to the show path for the entry' do
      sign_in subject
      chore_attributes = FactoryBot.attributes_for(:chore)
      expect { post chores_path, params: { chore: chore_attributes } }.to change(Chore, :count).by(1)
      expect(response).to redirect_to chore_path(id: Chore.last.id)
      sign_out subject
    end
  end
  describe 'post chores_path with invalid data' do
    it 'does not save a new entry or redirect' do
      sign_in subject
      chore_attributes = FactoryBot.attributes_for(:chore)
      chore_attributes.delete(:job)
      expect do
        post chores_path, params: { chore: chore_attributes }
      end.to_not change(Chore, :count)
      expect(response).to render_template(:new)
      sign_out subject
    end
  end
  describe 'put chore_path with valid data' do
    it 'updates an entry and redirects to the show path for the chore' do
      sign_in subject
      chore = FactoryBot.create(:chore)
      chore.update({ 'description' => 'rake leaves' })
      chore.reload
      expect do
        put chore_path(id: chore[:id]), params: { chore: chore.as_json }
      end.to_not change(Chore, :count)
      expect(response).to redirect_to chore_path({ id: chore[:id] })
      sign_out subject
    end
  end
  describe 'put chore_path with invalid data' do
    it 'does not update the chore record or redirect' do
      sign_in subject
      chore = FactoryBot.create(:chore)
      chore.update({ 'job' => '' })
      expect do
        put chore_path(id: chore.id), params: { chore: chore.as_json }
      end.to_not change(Chore, :count)
      expect(response).to render_template(:edit)
      sign_out subject
    end
  end
  describe 'delete a chore record' do
    it 'deletes a chore record' do
      sign_in subject
      chore = FactoryBot.create(:chore)
      chore.destroy
      expect do
        get chores_path
      end.to_not change(Chore, :count)
      expect(response).to render_template(:index)
      sign_out subject
    end
  end
end
