class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  # before_action :most_votes, only: :index
  before_action :authenticate_user!

  # GET /articles
  def index
    @articles = Article.all
    @most_voted_article = Article.most_voted.first
    @last_written_article = Article.last
    @categories_with_articles = Category.categories_with_articles
    # @category_latest_article = Article.latest_article(categories)
  end

  # GET /articles/1
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  def create
    @article = current_user.articles.build(article_params)
    # @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :text, :author_id, :category_id, :image)
  end
end
