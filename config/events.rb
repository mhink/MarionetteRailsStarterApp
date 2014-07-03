WebsocketRails::EventMap.describe do
  namespace :contacts do
    subscribe :syn, 'websockets/contacts#syn'
  end
end
