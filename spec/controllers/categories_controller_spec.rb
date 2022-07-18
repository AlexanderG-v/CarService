require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { create(:category) }

  describe 'GET #index' do
    let(:categories) { create_list(:category, 3) }

    before { get :index }

    it 'populates an array of all categories' do
      expect(assigns(:categories)).to match_array(categories)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: category } }

    it 'assigns the requested category to @category' do
      expect(assigns(:category)).to eq category
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns new Category to @category' do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'render show new' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: category } }

    it 'assigns the requested category to @category' do
      expect(assigns(:category)).to eq category
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'whth valid attributes' do
      it 'save a new category in the database' do
        expect { post :create, params: { category: attributes_for(:category) } }.to change(Category, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to assigns(:category)
      end
    end

    context 'whth invalid attributes' do
      it 'doen not save the category' do
        expect { post :create, params: { category: attributes_for(:category, :invalid) } }.not_to change(Category, :count)
      end

      it 're-renders to new view' do
        post :create, params: { category: attributes_for(:category, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'whth valid attributes' do
      it 'assigns new Category to @category' do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(assigns(:category)).to eq category
      end

      it 'changes executor attributes' do
        patch :update, params: { id: category, category: { title: 'new title' } }
        category.reload

        expect(category.title).to eq 'new title'
      end

      it 'redirects to update category' do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(response).to redirect_to category
      end
    end

    context 'whth invalid attributes' do
      before { patch :update, params: { id: category, category: attributes_for(:category, :invalid) } }

      it 'does not change category' do
        category.reload

        expect(category.title).to eq 'MyString'
      end

      it 're-renders to edit view' do
        expect(response).to render_template :edit
      end
    end
  end
  
  describe 'DELETE #destroy' do
    let!(:category) { create(:category) }

    it 'deletes the categories' do
      expect { delete :destroy, params: { id: category } }.to change(Category, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: category }
      expect(response).to redirect_to categories_path
    end
  end
end
