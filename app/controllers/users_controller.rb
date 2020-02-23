class UsersController < ApplicationController
  def dashboard
    @user = current_user
  end

  def month_games
    @user = current_user
    @month_games = Game.where(featured: true)
  end

end
