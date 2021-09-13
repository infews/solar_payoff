module SolarPayoff
  RSpec.describe PgeCsv do
    let(:csv_file) { "spec/fixtures/pge_electric_interval_data_3289324018_2021-08-05_to_2021-09-02.csv" }
    let(:pge_csv) { PgeCsv.new(csv_file) }

    describe "#parse" do
      let(:hours) { pge_csv.parse }
      let(:hour) { hours[4] }

      it "finds all of the PgeHours in the file" do
        expect(hours.length).to eq(24 * 29) # 24 hours over 29 days
      end

      it "builds the hours properly" do
        expect(hour.start).to eq(Time.new(2021, 8, 5) + 4 * 3600)
        expect(hour.dWh).to eq(100)
        expect(hour.cost).to eq(20)
      end
    end
  end
end
