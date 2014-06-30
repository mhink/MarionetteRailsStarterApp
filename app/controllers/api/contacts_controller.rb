class Api::ContactsController < ApplicationController
  def index
    contacts = [
      { id: 1, name: 'Matt Hink' },
      { id: 2, name: 'Michael Terkowitz' },
      { id: 3, name: 'Dan Bair' },
    ]

    render json: contacts
  end
end
