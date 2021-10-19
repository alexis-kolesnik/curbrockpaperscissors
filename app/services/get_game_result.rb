class GetGameResult < ApplicationService
  attr_reader :user_choice, :api_choice

  def initialize(user_choice, api_choice)
    @user_choice = user_choice
    @api_choice = api_choice
  end

  def call
    return 'user' if api_choice.nil?
    winner = define_winner(user_choice, api_choice)
  end

  private

  def define_winner(user_choice, api_choice)
    return 'api' if user_choice == 'curbrock' && api_choice == 'paper'
    return 'user' if user_choice == 'paper' && api_choice == 'curbrock'
    return 'api' if user_choice == 'paper' && api_choice == 'scissors'
    return 'user' if user_choice == 'scissors' && api_choice == 'paper'
    return 'api' if user_choice == 'scissors' && api_choice == 'curbrock'
    return 'user' if user_choice == 'curbrock' && api_choice == 'scissors'
    'noone'
  end
end
