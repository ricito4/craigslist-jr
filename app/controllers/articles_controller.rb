class ArticlesController < ApplicationController

  def new
    @article= Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to action: "secret", url: @article.url
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @category = Category.find(@article.category_id)
  end

  def edit
    @article = Article.find_by(url: params[:url])
    @categories = Category.all
  end

  def update
    @article = Article.find_by(url: params[:url])
    if @article.update_attributes(article_params)
      redirect_to action: "secret", url: @article.url
    else
      @errors = @article.errors.full_messages
      @categories = Category.all
      render 'edit'
    end
  end

  def destroy
    @article = Article.find_by(url: params[:url])
    @article.destroy
    redirect_to categories_path
  end

  def secret
    @article = Article.find_by(url: params[:url])
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :price, :description, :email, :category_id)
  end
end
