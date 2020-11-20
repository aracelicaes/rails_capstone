class Articles::VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    @article.votes.where(user_id: current_user.id).first_or_create

    redirect_to @article, notice: 'Thank You For Your Vote! ❤️'
  end

  def destroy
    @article.votes.where(user_id: current_user.id).destroy_all

    redirect_to @article, notice: 'Oh Man! Sorry You Didn\'t love it! 😞'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
