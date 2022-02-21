# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context 'during validations' do
    context 'with name' do
      let :restaurant do
        described_class.new(
          name: '',
          address: 'valid address',
          description: 'valid description',
          phone_number: '0985643267'
        )
      end

      it 'empty' do
        expect(restaurant).not_to be_valid
        restaurant.name = 'test name'
        expect(restaurant).to be_valid
      end

      it 'of minimum 2 symbols' do
        expect(restaurant).not_to be_valid
        restaurant.name = 'va'
        expect(restaurant).to be_valid
      end
    end

    context 'with address' do
      let :restaurant do
        described_class.new(
          name: 'valid name',
          address: 'te',
          description: 'valid description',
          phone_number: '0985643267'
        )
      end

      it 'empty' do
        expect(restaurant).not_to be_valid
        restaurant.address = ''
        expect(restaurant).to be_valid
      end

      it 'of minimum 3 symbols' do
        expect(restaurant).not_to be_valid
        restaurant.address = 'val'
        expect(restaurant).to be_valid
      end
    end

    context 'with description' do
      let :restaurant do
        described_class.new(
          name: 'valid name',
          address: 'valid address',
          description: 'fail',
          phone_number: '0985643267'
        )
      end

      it 'empty' do
        expect(restaurant).not_to be_valid
        restaurant.description = ''
        expect(restaurant).to be_valid
      end

      it 'minimum 6 symbols' do
        expect(restaurant).not_to be_valid
        restaurant.description = 'valid1'
        expect(restaurant).to be_valid
      end
    end

    context 'with phone number' do
      let :restaurant do
        described_class.new(
          name: 'valid name',
          address: 'valid address',
          description: 'valid description',
          phone_number: ''
        )
      end

      it 'of minimum 5 symbols' do
        expect(restaurant).not_to be_valid
        restaurant.phone_number = '09856'
        expect(restaurant).to be_valid
      end

      it 'without alphabetic characters' do
        expect(restaurant).not_to be_valid
        restaurant.phone_number = '0985678'
        expect(restaurant).to be_valid
      end
    end
  end
end
