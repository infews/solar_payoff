module SolarPayoff
  RSpec.describe PgeHour do
    let(:pge_hour) { PgeHour.new(attributes) }
    let(:attributes) do
      {
        start: Time.new(2021, 8, 5, 0, 0),
        dWh: 34,
        cost: 13
      }
    end

    context "construction" do
      it "should be creatable from attributes" do
        expect(pge_hour.start).to eq(Time.new(2021, 8, 5, 0, 0))
        expect(pge_hour.dWh).to eq(34)
        expect(pge_hour.cost).to eq(13)
      end
    end

    context "formatters" do
      context "#kWh" do
        it "returns the power in kilowatt hours" do
          expect(pge_hour.kWh).to eq(0.34)
        end
      end

      context "#dollar_cost" do
        it "returns the cost in dollars" do
          expect(pge_hour.dollar_cost).to eq(0.13)
        end
      end
    end
  end
end
