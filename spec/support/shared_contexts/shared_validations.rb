shared_context 'when execute request' do
  before { http_request }
end

shared_examples 'when validate status 200 ok' do
  it 'responds with ok status' do
    expect(response).to have_http_status(:ok)
  end
end

shared_examples 'when validate status 422 unprocessable_entity' do
  it 'responds with unprocessable entity status' do
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
