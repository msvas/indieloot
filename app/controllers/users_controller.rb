class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :month_games, :payment,
                                  :library, :account]
  before_action :check_subscription, except: [:payment, :account, :library]

  def dashboard

  end

  def month_games
    @month_games = Game.where(featured: true)
    @redeemed_keys = Key.where("game_id IN (?) AND user_id = ? AND status = ?",
                                @month_games.ids.to_a, current_user.id,
                                Key.statuses[:redeemed])
  end

  def redeem_key
    game = Game.find(params[:game_id])
    existing_key = Key.find_by(game: game, user: current_user)
    if existing_key.nil?
      game_key = Key.where(game: game, status: Key.statuses[:unredeemed], user_id: nil).first
      unless game_key.nil?
        game_key.update(user: current_user, given_date: Time.now, status: Key.statuses[:redeemed])
        respond_to do |format|
          format.json { render json: { :key => game_key.encrypted_key } }
        end
      end
    end
  end

  def payment

  end

  def library
    @my_keys = Key.where("user_id = ? AND status = ?",
                          @user.id,
                          Key.statuses[:redeemed])
  end

  private

  def set_user
    @user = current_user
  end

end
