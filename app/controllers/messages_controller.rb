class MessagesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.order("created_at DESC")
    #It looks like Ruby 1.9.3 has a different idea of Date.parse. It doesn't want to parse the date from the query string as it was in the Cast. Had to add the first day of the month to the controller to get it to parse it correctly. Else it parses it as if the month is the day, so the calendar never appears to change.
    @date = params[:month] ? Date.parse("01-#{params[:month]}") : Date.today
    # @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(message_params)
    @message.published_on = @message.published_on.to_date
    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to message_path(@message), notice: "Message updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path, notice: "Message deleted successfully."
  end

  private

    def message_params
      params.require(:message).permit(:title, :description, :published_on)
    end

    def find_message
      @message = Message.find(params[:id])
    end
end
