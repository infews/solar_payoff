module SolarPayoff
  RSpec.describe SunpowerHour do
    let(:sunpower_hour) { SunpowerHour.new(attributes) }
    let(:attributes) do
      {
        start: Time.new(2021, 8, 5, 0, 0),
        dWh: 34
      }
    end

    context "construction" do
      it "should be creatable from attributes" do
        expect(sunpower_hour.start).to eq(Time.new(2021, 8, 5, 0, 0))
        expect(sunpower_hour.dWh).to eq(34)
      end
    end

    context "formatters" do
      context "#kWh" do
        it "returns the power in kilowatt hours" do
          expect(sunpower_hour.kWh).to eq(0.34)
        end
      end
    end
  end
end
