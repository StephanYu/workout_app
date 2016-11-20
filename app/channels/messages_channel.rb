# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def check_in(data)
    room_id = "#{data['room_id']}"
    stream_from "messages_room_#{room_id}"
  end
  
  def check_out
    stop_all_streams
  end
end
