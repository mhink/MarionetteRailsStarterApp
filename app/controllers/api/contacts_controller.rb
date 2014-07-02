class Api::ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: api_contacts_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    head :no_content
  end

  private
    def contact_params
      params.require(:contact).permit(:name)
    end
end
