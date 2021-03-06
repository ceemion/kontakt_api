class V1::ContactsController < V1::BaseController
  before_action :get_contact, except: [:index, :create]

  def index
    render json: Contact.all,
           serializer: V1::ContactsCollectionSerializer,
           status: :ok
  end

  def show
    status = @contact ? :ok : :not_found
    render json: @contact,
           serializer: V1::ContactsSerializer,
           status: status
  end

  def create
    new_contact = Contact.new(contact_params)

    if new_contact.save
      render json: new_contact,
             serializer: V1::ContactsSerializer,
             status: :created
    else
      render json: 'Could not create contact, please try again', status: :unprocessable_entity
    end
  end

  def update
    @contact.update!(contact_params)
    render json: @contact,
           serializer: V1::ContactsSerializer,
           status: :ok
  end

  def destroy
    @contact.destroy
    render json: 'Contact deleted', status: :no_content
  end

  def archive
    if @contact.archived
      response = 'Contact already archived'
    else
      @contact.archived = true
      @contact.save!
      response = 'Contact archived'
    end

    render json: response, status: :no_content
  end

  private

  def contact_params
    phone_numbers = params.require(:contact).permit(phone_numbers: params[:contact][:phone_numbers].keys)
    params.require(:contact).permit(:first_name, :last_name, :email, :address, :company, :job_title, :dob).merge(user: current_user).merge(phone_numbers)
  end

  def get_contact
    @contact = Contact.find_by(id: params[:id])
  end
end
