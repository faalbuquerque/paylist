class Api::V1::ListSetsController < Api::V1::ApiController
  def index
    @list_sets = ListSet.all

    render json: { lists: @list_sets.as_json(except: %i[created_at updated_at])}
  end

  def show
    @list_set = ListSet.find(params[:id])

    render json: { list: @list_set.as_json(except: %i[created_at updated_at])},
           status: :ok
  end

  def create
    @list_set = ListSet.new(list_set_params)
    @list_set.save!

    render json: { list: @list_set.as_json(except: %i[created_at updated_at]) },
           status: :created

  rescue ActionController::ParameterMissing
    render json: { message: 'Dados inválidos' }, status: :precondition_failed
  end


  private

  def list_set_params
    params.require(:list_set).permit(:name)
  end
end
