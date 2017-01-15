require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe 'バリデーション' do
    it 'user_idは必須' do
      is_expected.to validate_presence_of(:user_id)
    end
    it 'book_idは必須' do
      is_expected.to validate_presence_of(:book_id)
    end
  end
end
