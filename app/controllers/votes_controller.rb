class VotesController < ApplicationController


  def like
    article = Article.find(params[:id])
    article.liked_by(current_user)
    redirect_to :back
  end


  def unlike
    article = Article.find(params[:id])
    article.unliked_by(current_user)
    redirect_to :back
  end

end