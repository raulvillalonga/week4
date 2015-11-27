class CommentsController < ApplicationController

  def create
    concert = Concert.find_by(id: params[:concert_id])
    @comment = Comment.new(comment_params)

    if (@comment.save)
      flash[:notice] = "Comment add successfully"
      redirect_to(concert_path(concert))
    else
      flash[:alert] = "Something's not right"
      render 'show'
    end
  end


  private 

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

end