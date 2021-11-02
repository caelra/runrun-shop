# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  let(:user) { create(:user) }

  before :each do
    @request.session[:user_id] = user.id
  end

  describe 'GET cars#index' do
    let!(:cars) { create_list(:car, 2) }

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end

    it 'returns http success' do
      get :index

      expect(response).to be_successful
    end

    it 'request list of cars' do
      get :index

      expect(assigns(:cars).to_a).to eq(cars.to_a)
    end
  end

  describe 'GET cars#new' do
    let(:car) { build(:car) }

    it 'renders the index template' do
      get :new

      expect(response).to render_template('new')
    end

    it 'returns http success' do
      get :new

      expect(response).to be_successful
    end

    it 'initialize a new car' do
      get :new

      expect(assigns(:car)).to_not eq nil
      expect(assigns(:car)).to be_a_new(Car)
    end
  end

  describe 'GET cars#show' do
    it 'renders the index template' do
      car = create(:car)
      get :show, params: { id: car.id }

      expect(response).to render_template('show')
    end

    it 'returns http success' do
      car = create(:car)
      get :show, params: { id: car.id }

      expect(response).to be_successful
    end
  end

  describe 'GET cars#show' do
    it 'renders the index template' do
      car = create(:car)
      get :show, params: { id: car.id }

      expect(response).to render_template('show')
    end

    it 'returns http success' do
      car = create(:car)
      get :show, params: { id: car.id }

      expect(response).to be_successful
    end
  end

  describe 'POST cars#create' do
    it 'update car and redirect' do
      post :create, params: { car: { model: 'model 1', price: 100_000 } }

      expect(response).to be_redirect
    end
  end

  describe 'PATCH cars#update' do
    it 'update car and redirect' do
      car = create(:car)
      patch :update, params: { id: car.id, car: { model: 'New model' } }

      expect(response).to be_redirect
    end
  end

  describe 'PATCH cars#delete' do
    it 'update car and redirect' do
      car = create(:car)
      delete :destroy, params: { id: car.id }

      expect(response).to be_redirect
    end
  end
end
