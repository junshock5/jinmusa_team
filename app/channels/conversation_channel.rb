class ConversationChannel < ApplicationCable::Channel
  def subscribed
     stream_from "conversations-#{current_user.id}"
    # stream_from "some_channel"
  end

  def unsubscribed
     stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
     message_params = data['message'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
  end
   Message.create(message_params)
  end
end
