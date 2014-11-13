require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  describe 'GET #index' do

    it "assigns @articles variable" do
      articles = FactoryGirl.create_list(:article, 3)
      get :index
      expect(assigns(:articles)).to eq(articles)
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template(:index) 
    end
  end

  describe 'GET #new' do

    it "assigns @article variable" do
      get :new
      expect(assigns(:article)).to be_instance_of(Article)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template(:new) 
    end
  end

  describe 'POST #create' do

    context "with valid attributes" do
    let(:attrs) { FactoryGirl.attributes_for(:article) }

      it "saves the new article in the database" do
        expect {
          post :create, article: attrs
        }.to change(Article, :count).by(1)
      end

      it "creates flash message with success" do
        post :create, article: attrs
        expect(flash[:success]).to be_present
      end

      it "redirects to the new article" do
        post :create, article: attrs
        expect(response).to redirect_to(Article.last)
      end
    end

    context "with invalid attributes" do

      it "does not save the new article in the database" do
        expect {
          post :create, article: FactoryGirl.attributes_for(:invalid_article)
        }.to_not change(Article, :count)
      end
      it "re-renders the #new view" do
        post :create, article: FactoryGirl.attributes_for(:invalid_article)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    let(:article) { FactoryGirl.create(:article) }

    it "assigns @article variable" do
      get :show, id: article[:id]
      expect(assigns(:article)).to eq(article)
    end

    it "renders the #show view" do
      get :show, id: article[:id]
      expect(response).to render_template(:show)
    end
  end

end
