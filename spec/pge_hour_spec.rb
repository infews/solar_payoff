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

    context "uniqueness of time" do
      it "allows only one record of this time" do
        pge_hour.save
        another_hour = PgeHour.new({
          start: Time.new(2021, 8, 5, 0, 0),
          dWh: 104,
          cost: 43
        })
        expect(another_hour).to_not be_valid
        expect(another_hour.errors.messages[:start]).to include("has already been taken")
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
