require 'rails_helper'

RSpec.describe GetGameResult do
  describe '#call' do
    let(:user_choice) { 'paper' }

    context 'no api choice' do
      it 'return user as winner' do
        expect(described_class.call(user_choice, nil)).to eq('user')
      end

      context 'api choice equal to user choice' do
        let(:api_choice) { 'paper' }

        it 'return user as winner' do
          expect(described_class.call(user_choice, api_choice)).to eq('noone')
        end
      end

      context 'api choice higher than user choice' do
        let(:api_choice) { 'scissors' }

        it 'return user as winner' do
          expect(described_class.call(user_choice, api_choice)).to eq('api')
        end
      end

      context 'api choice lower than user choice' do
        let(:api_choice) { 'rock' }

        it 'return user as winner' do
          expect(described_class.call(user_choice, api_choice)).to eq('user')
        end
      end
    end
  end
end
