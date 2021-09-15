module SolarPayoff
  RSpec.describe SunpowerXls do
    let(:xls_file) { "spec/fixtures/sunpower_export_20210805_20210805.xlsx" }
    let(:sunpower_xls) { SunpowerXls.new(xls_file) }

    describe "#parse" do
      let(:hours) { sunpower_xls.parse }
      let(:hour) { hours[8] }

      it "finds all of the PgeHours in the file" do
        expect(hours.length).to eq(24) # 1 day of production
      end

      it "builds the hours properly" do
        expect(hour.start).to eq(Time.new(2021, 8, 5) + 8 * 3600)
        expect(hour.dWh).to eq(188)
      end
    end
  end
end
