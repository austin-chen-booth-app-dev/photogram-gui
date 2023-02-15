
class CommentsController < ApplicationController
  def insert_comment_record
    @photo_id = params.fetch("photo_id")
    @comment = Comment.new    

    @comment.photo_id = params.fetch("input_photo_id").to_i
    @comment.author_id = params.fetch("input_author_id").to_i
    @comment.body = params.fetch("input_comment")

    @comment.save

    redirect_to("/photos/#{@photo_id}")
  end
end
