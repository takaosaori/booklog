require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'GET /books' do
    subject { get :index }

    context 'Bookの情報が無い場合' do
      it 'Bookの取得数が0であること' do
        subject
        books = assigns(:books)
        expect(books.length).to eq(0)
      end
    end

    context 'Bookの情報がある場合' do
      before {
        5.times do
          create(:book)
        end
      }

      it 'Bookの情報が1つ以上取得できること' do
        subject
        books = assigns(:books)
        expect(books.length).to be >= 1
      end
    end
  end

  describe 'GET /books/:id' do
    let!(:test_book) { create(:book) }
    subject { get :show, id: test_book.id }

    it '@bookにBookオブジェクトが取得されること' do
      subject
      book = assigns(:book)
      expect(book.persisted?).to be_truthy
    end
    it 'URLに入力したidのBookが取得されること' do
      subject
      book = assigns(:book)
      # IDをチェック
      expect(book.id).to eq(test_book.id)
    end
  end

  describe 'GET /books/new' do
    subject { get :new }
    before { login }

    it '@bookに新規Bookオブジェクトが格納されていること' do
      subject
      book = assigns(:book)
      expect(book).to be_a_new(Book)
    end
  end

  describe 'POST /books' do
    subject { post :create, book: attributes_for(:book) }
    before { login }

    it '新しいBookが作成されること' do
      expect {
        subject
      }.to change(Book, :count).by(1)
    end
  end

  describe 'GET /books/:id' do
    let!(:test_book) { create(:book) }
    subject { get :edit, id: test_book.id }
    before { login }

    it '@bookにBookオブジェクトが取得されること' do
      subject
      book = assigns(:book)
      expect(book.persisted?).to be_truthy
    end
    it 'URLに入力したidのBookが取得されること' do
      subject
      book = assigns(:book)
      # IDをチェック
      expect(book.id).to eq(test_book.id)
    end
  end

  describe 'PATCH /books/:id' do
    let!(:book) { create(:book) }
    subject { patch :update, id: book.id, book: attributes_for(:book, title: 'タイトル変更') }
    before { login }

    it 'Bookが変更されること' do
      subject
      book.reload
      expect(book.title).to eq('タイトル変更')
    end
  end

  describe 'DELETE /books/:id' do
    let(:book) { create(:book) }
    subject { delete :destroy, id: book.id }
    before { login }
    it '商品が削除されること' do
      subject
      expect {
        Book.find(book.id)
      }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end

end