require 'rails_helper'

describe 'List sets API' do
  context 'get api/v1/list_sets'do
    it 'sucessfully' do
      ListSet.create(name:'Estudos')

      get '/api/v1/list_sets'

      expect(response).to  have_http_status(:ok)
      expect(response.content_type).to  include('application/json')
      expect(JSON.parse(response.body)['lists'].first['name']).to eq('Estudos')
    end
  end

  context 'post api/v1/list_sets'do
    it 'sucessfully' do

      post '/api/v1/list_sets', params: { list: { name: 'Consultas' }}

      expect(response).to  have_http_status(:ok)
      expect(response.content_type).to  include('application/json')
      expect(JSON.parse(response.body)['list'].first['name']).to eq('Consultas')
    end
  end
end
