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
  describe "GET #show" do
  it "インスタンス変数が期待したものになるか" do
    product = create(:product)
    get :show, params: { id: product }
    expect(assigns(:product)).to eq product
  end
    it "商品詳細ページに遷移するか" do
      product = create(:product)
      get :show, params: {id: product}
      expect(response).to render_template :show  
    end
  end
  describe 'GET #edit' do
  it "インスタンス変数の値が期待したものになるか" do
    product = create(:product)
    get :edit, params: { id: product }
    expect(assigns(:product)).to eq product
  end
  it "商品編集ページに遷移するか" do
    product = create(:product)
    get :edit, params: { id: product }
    expect(response).to render_template :edit
  end
end

end
