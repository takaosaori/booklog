require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  describe "POST #create" do
    let!(:user) { create(:user) }
    let!(:book) { create(:book) }
    subject { post :create, review: attributes_for(:review, user_id: user.id, book_id: book.id) }
    before { login }

    it '新しいReviewが作成されること' do
      expect {
        subject
      }.to change(Review, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    let(:review) { create(:review) }
    subject { delete :destroy, id: review.id }
    before { login }
    it 'Reviewが削除されること' do
      subject
      expect {
        Review.find(review.id)
      }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end

end