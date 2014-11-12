class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(params.require(:article).permit(:title, :content))
    flash[:info] = "New article created."
    redirect_to articles_url
  end
end
