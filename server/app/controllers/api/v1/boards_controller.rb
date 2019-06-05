class Api::V1::BoardsController < Api::V1::ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  skip_before_action :verify_authenticity_token

  # GET /api/v1/boards
  # GET /api/v1/boards.json
  def index
    @boards = current_user.boards.includes(:lists)
  end

  # GET /api/v1/boards/1
  # GET /api/v1/boards/1.json
  def show
  end

  # POST /api/v1/boards
  # POST /api/v1/boards.json
  def create
    @board = current_user.boards.build(board_params)
    respond_to do |format|
      if @board.save
        format.json { render :show, status: :created, location: @board }
      else
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/boards/1
  # PATCH/PUT /api/v1/boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.json { render :show, status: :ok, location: @board }
      else
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/boards/1
  # DELETE /api/v1/boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = current_user.boards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:board_name, :board_description, :user_id, :position)
    end
end
