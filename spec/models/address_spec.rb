require 'rails_helper'

RSpec.describe Address, :type => :model do
  describe '#new' do
    context 'Given a valid address' do
      it 'can create a new address' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 20500
                        )).to be_valid
      end
    end

    context 'Given bad address values' do
      it 'cannot create a new address' do
        expect(Address.new(
                          house_number: 1600,
                          street_name: 'Pennsylvania',
                          street_type: 'Avenue',
                          street_postdirection: 'NW',
                          city: 'Washington',
                          state: 'DC',
                          zip_5: 123
                        )).not_to be_valid
      end
    end

    describe '#to_s' do
      let(:address) { create(:address_ny) }
      it 'prints out the address components needed for mailing together as a string' do
        expect(address.to_s).to eq('129 W 81st St Apt 5A, New York, NY 10024')
      end
    end

    describe '#street_address' do
      context 'Given address without predirection' do
        let(:address) { create(:address_ny, street_predirection: nil) }
        it 'prints out the address components without an extra space' do
          expect(address.street_address).to eq('129 81st St Apt 5A')
        end
      end

      context 'Given address without postdirection' do
        let(:address) { create(:address_ny, street_postdirection: nil) }
        it 'prints out the address components without an extra space' do
          expect(address.street_address).to eq('129 W 81st St Apt 5A')
        end
      end

      context 'Given address without unit type' do
        let(:address) { create(:address_ny, unit_type: nil) }
        it 'prints out the address components without an extra space' do
          expect(address.street_address).to eq('129 W 81st St 5A')
        end
      end

      context 'Given address without unit number' do
        let(:address) { create(:address_ny, unit_number: nil) }
        it 'prints out the address components without an extra space' do
          expect(address.street_address).to eq('129 W 81st St Apt')
        end
      end
    end

    subject {
      described_class.new(
        house_number: 1600,
        street_name: 'Pennsylvania',
        street_type: 'Avenue',
        street_postdirection: 'NW',
        city: 'Washington',
        state: 'DC',
        zip_5: 20500
      )
    }

    it 'is not valid without a house number' do
      subject.house_number = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a street name' do
      subject.street_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a city' do
      subject.city = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a state' do
      subject.state = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a zip code' do
      subject.zip_5 = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a numeric house number' do
      subject.house_number = "abcde"
      expect(subject).not_to be_valid
    end

    it 'is not valid without a numeric zip code' do
      subject.zip_5 = "abcde"
      expect(subject).not_to be_valid
    end

    it 'is not valid with a zip code less than length 5' do
      subject.zip_5 = "1001"
      expect(subject).not_to be_valid
    end

  end
end
