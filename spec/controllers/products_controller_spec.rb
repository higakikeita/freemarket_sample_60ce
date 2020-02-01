require 'rails_helper'

describe ProductsController do
  describe 'GET #new' do
    it "renders the :new template" do
    end
  end
  describe 'POST #create' do
    it "renders the :create template" do
    end
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
  describe 'DELETE #destroy' do
    let(:product) { FactoryBot.create(:product) }
      it "リクエストが成功すること" do
      expect(product).to be_valid
      end
      it "商品が削除されること" do
        product=create(:product)
        expect do
          delete :destroy, params:{ id: product }
        end.to change(Product, :count).by(-1)
      end
  end
end
