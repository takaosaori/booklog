class BooksController < ApplicationController

  # 「index」,「show」以外のアクションはログインが必要
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @books = Book.includes(:bookmarks).order('updated_at DESC')
  end

  def show
    @book = Book.find(params[:id])
    if user_signed_in?
      # 自分のブックマークの選択
      @my_bookmark = @book.bookmarks.select{|s| s.user_id == current_user.id}.first
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.attributes = input_params
    @book.user_id = current_user.id
    if @book.valid? # バリデーションチェック
      @book.save!
      flash[:notice] = I18n.t('book.created')
      redirect_to action: :show, id: @book.id
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.attributes = input_params
    @book.user_id = current_user.id
    if @book.valid? # バリデーションチェック
      @book.save!
      flash[:notice] = I18n.t('book.updated')
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    flash[:notice] = I18n.t('book.deleted')
    redirect_to action: :index
  end

  private
  def input_params
    params.require(:book).permit(:title, :author, :publisher, :price, :publish_date, :caption, :image)
  end  
  
end
