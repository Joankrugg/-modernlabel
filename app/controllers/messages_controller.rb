class MessagesController < ApplicationController

  def create
    @artist = Artist.find(params[:artist_id])
    @user = current_user
    @message = Message.new(message_params)
    @message.user = @user
    @message.artist = @artist

    if @message.save
      respond_to do |format|
        format.html { redirect_to artist_path(@artist) }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'artists/show' }
        format.js  # <-- idem
      end
    end

  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @message = @artist.messages.find(params[:id])
    @message.destroy
    redirect_to artist_path(@artist)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end


end
