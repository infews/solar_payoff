module SolarPayoff
  RSpec.describe PgeHour do
    let(:pge_hour) { PgeHour.new(attributes) }
    let(:attributes) do
      {
        start: Time.new("2021-08-5 0:00"),
        dWh: 34,
        cost: 13
      }
    end
    context "construction" do
      it "should be creatable from attributes" do
        expect(pge_hour.start.to_s).to eq("2021-08-5 0:00")
        expect(pge_hour.dWh).to eq(34)
        expect(pge_hour.cost).to eq(13)
      end
    end
  end
end
