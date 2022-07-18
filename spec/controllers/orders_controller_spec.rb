require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order) { create(:order) }

  describe 'GET #index' do
    let(:orders) { create_list(:order, 3) }

    before { get :index }

    it 'populates an array of all orders' do
      expect(assigns(:orders)).to match_array(orders)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: order } }

    it 'assigns the requested order to @order' do
      expect(assigns(:order)).to eq order
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns new Order to @order' do
      expect(assigns(:order)).to be_a_new(Order)
    end

    it 'assigns new Order to @order with Service' do
      expect(assigns(:order).services.first).to be_a_new(Service)
    end

    it 'render show new' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: order } }

    it 'assigns the requested order to @order' do
      expect(assigns(:order)).to eq order
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'whth valid attributes' do
      it 'save a new order in the database' do
        expect { post :create, params: { order: attributes_for(:order) } }.to change(Order, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { order: attributes_for(:order) }
        expect(response).to redirect_to assigns(:order)
      end
    end

    context 'whth invalid attributes' do
      it 'doen not save the order' do
        expect { post :create, params: { order: attributes_for(:order, :invalid) } }.not_to change(Order, :count)
      end

      it 're-renders to new view' do
        post :create, params: { order: attributes_for(:order, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'whth valid attributes' do
      it 'assigns new Order to @order' do
        patch :update, params: { id: order, order: attributes_for(:order) }
        expect(assigns(:order)).to eq order
      end

      it 'changes order attributes' do
        patch :update, params: { id: order, order: { customer_name: 'new customer name' } }
        order.reload

        expect(order.customer_name).to eq 'new customer name'
      end

      it 'redirects to update order' do
        patch :update, params: { id: order, order: attributes_for(:order) }
        expect(response).to redirect_to order
      end
    end

    context 'whth invalid attributes' do
      before { patch :update, params: { id: order, order: attributes_for(:order, :invalid) } }

      it 'does not change order' do
        order.reload

        expect(order.customer_name).to eq 'MyString'
      end

      it 're-renders to edit view' do
        expect(response).to render_template :edit
      end
    end
  end
  
  describe 'DELETE #destroy' do
    let!(:order) { create(:order) }

    it 'deletes the orders' do
      expect { delete :destroy, params: { id: order } }.to change(Order, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: order }
      expect(response).to redirect_to orders_path
    end
  end
end
