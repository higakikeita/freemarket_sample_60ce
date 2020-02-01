require 'rails_helper'

describe ProductsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do
    let(:params) { create(:product) }
    context 'can save' do
      it "root_pathへ遷移するか" do
        get :create
        expect(response).to redirect_to(root_path)
      end
    end
    # context 'can not save' do
    #   let(:params) { create(:product, name: nil)}
    #   it ":new templateへ遷移するか" do
    #     get :create
    #     expect(response).to render_template :new
    #   end
    # end
  end
end