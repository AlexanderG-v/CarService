require 'rails_helper'

RSpec.describe ExecutorsController, type: :controller do
  let(:executor) { create(:executor) }

  describe 'GET #index' do
    let(:executors) { create_list(:executor, 3) }

    before { get :index }

    it 'populates an array of all executors' do
      expect(assigns(:executors)).to match_array(executors)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: executor } }

    it 'assigns the requested executor to @executor' do
      expect(assigns(:executor)).to eq executor
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns new Executor to @executor' do
      expect(assigns(:executor)).to be_a_new(Executor)
    end

    it 'render show new' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: executor } }

    it 'assigns the requested executor to @executor' do
      expect(assigns(:executor)).to eq executor
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'whth valid attributes' do
      it 'save a new executor in the database' do
        expect { post :create, params: { executor: attributes_for(:executor) } }.to change(Executor, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { executor: attributes_for(:executor) }
        expect(response).to redirect_to assigns(:executor)
      end
    end

    context 'whth invalid attributes' do
      it 'doen not save the executor' do
        expect { post :create, params: { executor: attributes_for(:executor, :invalid) } }.not_to change(Executor, :count)
      end

      it 're-renders to new view' do
        post :create, params: { executor: attributes_for(:executor, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'whth valid attributes' do
      it 'assigns new Executor to @executor' do
        patch :update, params: { id: executor, executor: attributes_for(:executor) }
        expect(assigns(:executor)).to eq executor
      end

      it 'changes executor attributes' do
        patch :update, params: { id: executor, executor: { name: 'new name' } }
        executor.reload

        expect(executor.name).to eq 'new name'
      end

      it 'redirects to update executor' do
        patch :update, params: { id: executor, executor: attributes_for(:executor) }
        expect(response).to redirect_to executor
      end
    end

    context 'whth invalid attributes' do
      before { patch :update, params: { id: executor, executor: attributes_for(:executor, :invalid) } }

      it 'does not change executor' do
        executor.reload

        expect(executor.name).to eq 'MyString'
      end

      it 're-renders to edit view' do
        expect(response).to render_template :edit
      end
    end
  end
  
  describe 'DELETE #destroy' do
    let!(:executor) { create(:executor) }

    it 'deletes the executors' do
      expect { delete :destroy, params: { id: executor } }.to change(Executor, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: executor }
      expect(response).to redirect_to executors_path
    end
  end
end
