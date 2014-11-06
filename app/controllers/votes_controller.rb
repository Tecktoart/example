class VotesController < ApplicationController


  def like
    article = Article.find(params[:id])
    current_user.like(article)
    redirect_to :back
  end

  def unlike
    article = Article.find(params[:id])
    current_user.unlike(article)
    redirect_to :back
  end
end