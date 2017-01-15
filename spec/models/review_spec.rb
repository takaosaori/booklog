require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'バリデーション' do
    it 'user_idは必須' do
      is_expected.to validate_presence_of(:user_id)
    end
    it 'book_idは必須' do
      is_expected.to validate_presence_of(:book_id)
    end
    it 'rankは必須' do
      is_expected.to validate_presence_of(:rank)
    end
    it 'rankは1〜5' do
      is_expected.to validate_inclusion_of(:rank).in_range(1..5)
    end
    it 'bodyは必須' do
      is_expected.to validate_presence_of(:body)
    end
    it 'bodyは空文字禁止' do
      is_expected.not_to allow_value('').for(:body)
    end
  end
end
