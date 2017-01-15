require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it 'nameは必須' do
      is_expected.to validate_presence_of(:name)
    end
    it 'emailは必須' do
      is_expected.to validate_presence_of(:email)
    end
    it '@を2個含むemailは無効' do
      is_expected.not_to allow_value("user@@gmali.com").for(:email)
    end
    it 'agreementは必須' do
      is_expected.to validate_presence_of(:agreement)
    end
    it 'agreementはtrueを許可し、falseを許可しない' do
      is_expected.to allow_value(true).for(:agreement)
      is_expected.not_to allow_value(false).for(:agreement)
    end
  end
end