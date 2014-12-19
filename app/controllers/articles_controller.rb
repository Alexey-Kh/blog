class ArticlesController < ApplicationController

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "New article created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])  
  end

  private

    def article_params
      params.require(:article).permit(:title, :content)
    end

end