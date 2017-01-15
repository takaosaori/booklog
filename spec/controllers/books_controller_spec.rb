require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'GET /books' do

  end

  describe 'GET /books/:id' do

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