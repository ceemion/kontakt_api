class V1::ContactsController < V1::BaseController
  def index
    render json: {users: []}, status: 200
  end
end
