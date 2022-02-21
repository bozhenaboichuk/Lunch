require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context 'validations' do
    context 'name' do
      it 'has a name' do
        restaurant = Restaurant.new(
          name: '',
          address: 'valid address',
          description: 'valid description',
          phone_number: '0985643267'
        )

        expect(restaurant).not_to be_valid
        restaurant.name = 'test name'
        expect(restaurant).to be_valid
      end
      
      it 'has a name minimum 2 symbols' do
        restaurant = Restaurant.new(
          name: 't',
          address: 'valid address',
          description: 'valid description',
          phone_number: '0985643267'
        )

        expect(restaurant).not_to be_valid
        restaurant.name = 'va'
        expect(restaurant).to be_valid
      end
    end

    context 'address' do
      it 'has no address' do
        restaurant = Restaurant.new(
          name: 'valid name',
          address: 'te',
          description: 'valid description',
          phone_number: '0985643267'
        )

        expect(restaurant).to_not be_valid
        restaurant.address = ''
        expect(restaurant).to be_valid
      end
      
      it 'has an address of minimum 3 symbols' do
        restaurant = Restaurant.new(
          name: 'valid name',
          address: 'te',
          description: 'valid description',
          phone_number: '0985643267'
        )

        expect(restaurant).to_not be_valid
        restaurant.address = 'val'
        expect(restaurant).to be_valid
      end
    end

    context 'description' do
      it 'has no description' do
        restaurant = Restaurant.new(
          name: 'valid name',
          address: 'valid address',
          description: 'fail',
          phone_number: '0985643267'
        )

        expect(restaurant).to_not be_valid
        restaurant.description = ''
        expect(restaurant).to be_valid
      end
      
      it 'has a description of minimum 6 symbols' do
        restaurant = Restaurant.new(
          name: 'valid name',
          address: 'valid address',
          description: 'fail',
          phone_number: '0985643267'
        )

        expect(restaurant).to_not be_valid
        restaurant.description = 'valid1'
        expect(restaurant).to be_valid
      end
    end

    context 'phone number' do
      it 'has a phone number' do
        restaurant = Restaurant.new(
          name: 'valid name',
          address: 'valid address',
          description: 'valid description',
          phone_number: ''
        )

        expect(restaurant).to_not be_valid
        restaurant.phone_number = '0875643278'
        expect(restaurant).to be_valid
      end
      
      it 'has a phone number of minimum 5 symbols' do
        restaurant = Restaurant.new(
          name: 'valid name',
          address: 'valid address',
          description: 'valid description',
          phone_number: '0985'
        )

        expect(restaurant).to_not be_valid
        restaurant.phone_number = '09856'
        expect(restaurant).to be_valid
      end
      
      it 'has a phone number without alphabetic characters' do
        restaurant = Restaurant.new(
          name: 'valid name',
          address: 'valid address',
          description: 'valid description',
          phone_number: '0985abdv'
        )

        expect(restaurant).to_not be_valid
        restaurant.phone_number = '0985678'
        expect(restaurant).to be_valid
      end
    end
  end
end
