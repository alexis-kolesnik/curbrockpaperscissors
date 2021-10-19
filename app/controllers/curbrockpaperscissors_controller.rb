class CurbrockpaperscissorsController < ApplicationController
  def index
  end

  def play
  end

  def choice
    @player_choice = permit_params(params)[:state]
    @api_choice = ApiGetResult.call || 'keeps silence'
    @winner = GetGameResult.call(@player_choice, @api_choice)
  end

  private

  def permit_params(params)
    params.permit(:state)
  end
end
