class Websockets::ContactsController < WebsocketRails::BaseController
  def initialize_session
    puts 'initializing websocket session.'
    controller_store[:message_count] = 0
  end

  def syn
    controller_store[:message_count] += 1

    puts "Heard contacts.syn! (#{controller_store[:message_count]} so far.) Message is: #{message.inspect}"

    send_message :ack, {message: 'Hello from Rails!'}
  end
end
