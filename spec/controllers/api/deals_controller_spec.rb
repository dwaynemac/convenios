require 'spec_helper'

describe Api::DealsController do

  describe "GET /api/deals.json" do
    before do
      get :index, format: :json
    end

    it { should respond_with 200 }
  end
end
