class ContactsController < ApplicationController
  before_action :set_contact, only: [:destroy, :edit, :update]

  def create

    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to action_users_path
    else
      @artist = @contact.artist
      render 'artists/show'
    end
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js  # <-- will render `app/views/contacts/update.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js  # <-- will render `app/views/contacts/update.js.erb`
      end
    end
  end

  def destroy
    @contact.destroy
    render 'artists/show'
  end

  private

  def contact_params
    params.require(:contact).permit(:artist_id ,:content)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
