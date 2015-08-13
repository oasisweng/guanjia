class ContactsController < ApplicationController
  respond_to :html, :json

  def index
    @contacts = @user.contacts
    respond_with(@contacts)
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @contact = @user.contacts.build(contact_params)
    if @contact.save
      redirect_to user_path(@user)
      flash.now[:notice] = "create contact successfully"
    else
      flash.now[:warning] = "create contact failed"
    end
  end

  def destroy 
    @contact = Contact.find(params[:id])
    @user = @contact.user
    if @contact.destroy
      redirect_to user_path(@user)
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to user_path(@contact.user)
    end
  end 


  private

  def contact_params
    params.require(:contact).permit(:full_name,:phone_no,:male,:address)
  end


end
