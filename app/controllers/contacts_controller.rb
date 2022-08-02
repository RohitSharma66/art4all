class ContactsController < ApplicationController
  after_action :verify_authorized, except: [:new, :create], unless: :skip_pundit?
  before_action :contact_params, only: [:create]
    def new
      @contact = Contact.new
    end
  
    def create
      @contact = Contact.new(contact_params)
      @contact.request = request
      if @contact.deliver
        flash.now[:notice] = 'Thank you for your message!'
      else
        flash.now[:error] = 'Could not send message'
        render :new
      end
    end

    private
    def contact_params
      params.require(:contact).permit(:name, :email, :message, :nickname, :captcha)
    end
end
