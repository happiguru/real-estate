require 'rails_helper'

RSpec.describe Apartment, type: :model do
  describe 'Validation' do
    it { is_expected.to validate_presence_of(:apartment_name) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:description_short) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
