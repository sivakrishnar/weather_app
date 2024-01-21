describe GeocoderService do

    describe 'Fetch geocode service for an address with just city and state' do
      let(:city) { GeocoderService.new("Cupertino, CA") }
      it "should populate geocoder information without any error", :vcr do
        expect(city.populate_geocoder_info).to be_truthy
      end
    end

    describe 'Fetch geocode service for an address with just city' do
        let(:cupertino_city_95014) { GeocoderService.new("Cupertino") }
        it "should populate geocoder information without any error", :vcr do
          expect(cupertino_city_95014.populate_geocoder_info).to be_truthy
        end
    end

    describe 'Fetch geocode service for a valid zipcode' do
      let(:city_with_address) { GeocoderService.new("1900 Prairie City Rd, Folsom, CA") }
      it "should populate geocoder information without any error", :vcr do
        expect(city_with_address.populate_geocoder_info).to be_truthy
        expect(city_with_address.zipcode).to eq("95630")
      end
    end

    describe 'Fetch geocode service for an address with no street number' do
        let(:cupertino_city_with_address2) { GeocoderService.new("Gold Rush Dr, Folsom, CA") }
        it "should populate geocoder information without any error", :vcr do
          expect(cupertino_city_with_address2.populate_geocoder_info).to be_truthy
          expect(cupertino_city_with_address2.zipcode).to eq("95628")
        end
    end

    ### UNHAPPY TEST CASES

    describe 'Fetch geocode service for an address dummy road but valid city' do
        let(:dummy_city1) { GeocoderService.new("Dummy Rd, Cupertino, CA") }
        it "should not populate geocoder information and should not throw any error", :vcr do
          expect(dummy_city1.populate_geocoder_info).to be_falsey
        end
    end
    
    describe 'Fetch geocode service for a dummy city' do
        let(:dummy_city2) { GeocoderService.new("Foobart") }
        it "should not populate geocoder information and should not throw any error", :vcr do
          expect(dummy_city2.populate_geocoder_info).to be_falsey
        end
    end

    describe 'Fetch geocode service for a dummy city' do
        let(:empty_address) { GeocoderService.new("") }
        it "should not populate geocoder information and should not throw any error", :vcr do
          expect(empty_address.populate_geocoder_info).to be_falsey
        end
    end

    describe 'Fetch geocode service for a dummy city' do
        let(:nil_as_address) { GeocoderService.new(nil) }
        it "should not populate geocoder information and should not throw any error", :vcr do
          expect(nil_as_address.populate_geocoder_info).to be_falsey
        end
    end
  end