require 'rails_helper'

describe FibonacciController do
  describe 'POST #get_position' do
    subject(:http_request) { post :get_position, params: params }

    context 'when post with nil value' do
      include_context 'when execute request'

      let(:params) { { position: "" } }

      include_examples 'when validate status 422 unprocessable_entity'
    end
    
    context 'when post with invalid value' do
      include_context 'when execute request'

      let(:params) { { position: "a" } }

      include_examples 'when validate status 422 unprocessable_entity'
    end

    context 'when post with value 10' do
      include_context 'when execute request'

      let(:params) { { position: "10" } }

      include_examples 'when validate status 200 ok'
      it { expect(response.parsed_body).to eq(55) }
    end

    context 'when post with value X' do
      include_context 'when execute request'

      let(:params) { { position: "#{Faker::Number.within(range: 1..1000)}" } }

      include_examples 'when validate status 200 ok'
    end
  end
end
