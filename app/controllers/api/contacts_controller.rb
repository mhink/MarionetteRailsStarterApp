class Api::ContactsController < ApplicationController
  def index
    contacts = [
      { name: 'Matt Hink' },
      { name: 'Michael Terkowitz' },
      { name: 'Dan Bair' },
    ]

    render json: contacts
  end
end
