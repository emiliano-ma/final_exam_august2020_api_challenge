class Api::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.pry
    article = Article.find(params["article"])
    comment = Comment.create(user: current_user)


  end
end
