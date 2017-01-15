require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'バリデーション' do
    it 'titleは必須' do
      is_expected.to validate_presence_of(:title)
    end
    it 'user_idは必須' do
      is_expected.to validate_presence_of(:user_id)
    end
    it 'authorは必須' do
      is_expected.to validate_presence_of(:author)
    end
    it 'publisherは必須' do
      is_expected.to validate_presence_of(:publisher)
    end
    it 'priceは必須' do
      is_expected.to validate_presence_of(:price)
    end
    it 'priceは数値' do
      is_expected.to validate_numericality_of(:price)
    end
    it 'publish_dateは必須' do
      is_expected.to validate_presence_of(:publish_date)
    end
  end
end