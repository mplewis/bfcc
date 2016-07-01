class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_logged_in, only: [:index, :create, :update, :destroy]
  before_action :ensure_owner!, only: [:update, :destroy]

  # GET /polls
  def index
    @polls = Poll.where user: current_user
  end

  # GET /polls/1
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  def create
    @poll = current_user.polls.build(poll_params)

    if @poll.save
      redirect_to @poll, notice: 'Poll was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /polls/1
  def update
    ensure_owner!
    if @poll.update(poll_params)
      redirect_to @poll, notice: 'Poll was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /polls/1
  def destroy
    ensure_owner!
    @poll.destroy
    redirect_to polls_url, notice: 'Poll was successfully destroyed.'
  end

  # POST /polls/1/vote
  def vote
    puts "voted with params: #{params}"
    redirect_to :back, notice: 'Your vote was cast.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_poll
    @poll = Poll.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def poll_params
    params.require(:poll).permit(:text)
  end

  # Only proceed with this action if the poll belongs to the current user.
  def ensure_owner!
    redirect_to @poll, alert: 'This poll can only be modified by its creator.' unless current_user == @poll.user
  end
end
