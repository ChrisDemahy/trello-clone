class BoardUsersController < ApplicationController
  before_action :set_board_user, only: [:show, :update, :destroy]

  # GET /board_users
  def index
    @board_users = BoardUser.all

    render json: @board_users
  end

  # GET /board_users/1
  def show
    render json: @board_user
  end

  # POST /board_users
  def create
    @board_user = BoardUser.new(board_user_params)

    if @board_user.save
      render json: @board_user, status: :created, location: @board_user
    else
      render json: @board_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /board_users/1
  def update
    if @board_user.update(board_user_params)
      render json: @board_user
    else
      render json: @board_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /board_users/1
  def destroy
    @board_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_user
      @board_user = BoardUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def board_user_params
      params.require(:board_user).permit(:board_id, :user_id)
    end
end
