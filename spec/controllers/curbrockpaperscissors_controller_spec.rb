require 'rails_helper'

RSpec.describe CurbrockpaperscissorsController, type: :controller do
  let(:user_choice) { 'paper' }

  context '#index' do
    it 'return succesful response' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  context '#play' do
    it 'return succesful response' do
      get :play

      expect(response).to have_http_status(:ok)
    end
  end

  context '#choice' do
    let(:api_choice) { 'rock' }

    it 'return correct variables' do
      allow_any_instance_of(ApiGetResult).to receive(:call).and_return(api_choice)
      get :choice, params: { state: user_choice }

      expect(response).to have_http_status(:ok)
      expect(assigns(:player_choice)).to eq(user_choice)
      expect(assigns(:api_choice)).to eq(api_choice)
      expect(assigns(:winner)).to eq('user')
    end
  end

  context '#permit_params' do
    it 'permit params' do
      params = ActionController::Parameters.new(state: user_choice)

      expect(controller.send(:permit_params, params).permitted?).to be(true)
    end
  end
end
