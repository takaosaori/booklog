class BookmarksController < ApplicationController
    
  def create
    bookmark = Bookmark.new
    bookmark.attributes = input_params
    bookmark.user_id = current_user.id
    if bookmark.valid? # バリデーションチェック
      bookmark.save!
      flash[:notice] = I18n.t('bookmark.created')
      redirect_to book_path(bookmark.book_id)
    else
      flash[:alert] = bookmark.errors.full_messages
      redirect_to request.referer
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    book_id = bookmark.book_id
    bookmark.destroy!
    flash[:notice] = I18n.t('bookmark.deleted')
    redirect_to book_path(book_id)
  end

  private
  def input_params
    params.require(:bookmark).permit(:book_id)
  end
    
end
