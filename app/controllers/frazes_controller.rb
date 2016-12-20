class FrazesController < ApplicationController
  before_action :set_fraze, only: [:show, :edit, :update, :destroy]

  def create_game
    if Fraze.count < 25
      redirect_to frazes_path, alert: "Not enough frazes"
    else
      UserFraze.where(user: current_user).destroy_all
      random_ids = Fraze.pluck(:id).shuffle.first(25)
      frazes = Fraze.find(random_ids)
      frazes.each do |fraze|
        UserFraze.create!(user: current_user, fraze: fraze, checked: false)
      end
      redirect_to game_frazes_path
    end
  end

  def game
    if UserFraze.where(user: current_user).count != 25
      redirect_to frazes_path, alert: "Create game first"
    else
      @user_frazes = UserFraze.where(user: current_user).order(:created_at)
    end
  end

  def all_games
    @users = User.all.order(:created_at).reject { |u| u.user_frazes.count != 25 }
  end

  def toggle_check
    if UserFraze.exists?(params[:user_fraze_id])
      user_fraze = UserFraze.find(params[:user_fraze_id])
      user_fraze.checked = !user_fraze.checked
      user_fraze.save
      redirect_to game_frazes_path
    else
      redirect_to game_frazes_path, alert: "Fraze not found"
    end
  end

  # GET /frazes
  # GET /frazes.json
  def index
    @frazes = Fraze.all.order(created_at: :desc)
  end

  # GET /frazes/1
  # GET /frazes/1.json
  def show
  end

  # GET /frazes/new
  def new
    @fraze = Fraze.new
  end

  # GET /frazes/1/edit
  def edit
  end

  # POST /frazes
  # POST /frazes.json
  def create
    @fraze = Fraze.new(fraze_params)

    respond_to do |format|
      if @fraze.save
        format.html { redirect_to frazes_path, notice: 'Fraze was successfully created.' }
        format.json { render :show, status: :created, location: @fraze }
      else
        format.html { render :new }
        format.json { render json: @fraze.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frazes/1
  # PATCH/PUT /frazes/1.json
  def update
    respond_to do |format|
      if @fraze.update(fraze_params)
        format.html { redirect_to @fraze, notice: 'Fraze was successfully updated.' }
        format.json { render :show, status: :ok, location: @fraze }
      else
        format.html { render :edit }
        format.json { render json: @fraze.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frazes/1
  # DELETE /frazes/1.json
  def destroy
    @fraze.destroy
    respond_to do |format|
      format.html { redirect_to frazes_url, notice: 'Fraze was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fraze
      @fraze = Fraze.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fraze_params
      params.require(:fraze).permit(:body)
    end
end
