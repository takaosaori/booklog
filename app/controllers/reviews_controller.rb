class ReviewsController < ApplicationController
    
  def create
    review = Review.new
    review.attributes = input_params
    review.user_id = current_user.id
    if review.valid? # バリデーションチェック
      review.save!
      flash[:notice] = I18n.t('review.created')
      redirect_to book_path(review.book_id)
    else
      flash[:alert] = review.errors.full_messages
      redirect_to request.referer
    end
  end

  def destroy
    review = Review.find(params[:id])
    book_id = review.book_id
    review.destroy!
    flash[:notice] = I18n.t('review.deleted')
    redirect_to book_path(book_id)
  end

  private
  def input_params
    params.require(:review).permit(:book_id, :rank, :body)
  end
    
end
