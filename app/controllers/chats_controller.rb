class ChatsController < ApplicationController

  def index
  end

  def send_chat
    data = {username: current_user.username, avatar: current_user.image.chat.url, text: params[:chat_input]}
    Pusher.trigger(params[:channel], 'message', data)
    render nothing: true
  end
end
