require 'spec_helper'

RSpec.describe Luhn, type: :model do
  describe 'is_valid?' do
    it 'should return true if the number is valid' do
      expect(Luhn.is_valid?(4194560385008504)).to be true
    end

    it 'should return false if the number is not valid' do
      expect(Luhn.is_valid?(4194560385008505)).to be false
    end

    it 'should give the wrong answer if you begin on the left side for valid numbers' do
      expect(Luhn.is_valid?(377681478627336)).to be true
    end

    it 'should give the wrong answer if you begin on the left for invalid numbers' do
      expect(Luhn.is_valid?(377681478627337)).to be false
    end
  end
end
