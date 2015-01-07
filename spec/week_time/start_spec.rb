RSpec.describe Biz::WeekTime::Start do
  subject(:week_time) {
    described_class.new(week_minute(wday: 0, hour: 9, min: 30))
  }

  describe "#day_minute" do
    it "returns the corresponding day minute" do
      expect(week_time.day_minute).to eq day_minute(hour: 9, min: 30)
    end
  end

  describe "#hour" do
    it "returns the corresponding hour" do
      expect(week_time.hour).to eq 9
    end
  end

  describe "#minute" do
    it "returns the corresponding minute" do
      expect(week_time.minute).to eq 30
    end
  end

  describe "#timestamp" do
    it "returns the corresponding timestamp" do
      expect(week_time.timestamp).to eq '09:30'
    end
  end

  describe "#strftime" do
    it "returns a properly formatted string" do
      expect(week_time.strftime('%A %H:%M %p')).to eq 'Sunday 09:30 AM'
    end
  end

  context "when the week minute is on a day boundary" do
    subject(:week_time) {
      described_class.new(Biz::DayOfWeek::TUESDAY.start_minute)
    }

    describe "#day_minute" do
      it "returns zero" do
        expect(week_time.day_minute).to eq 0
      end
    end

    describe "#hour" do
      it "returns zero" do
        expect(week_time.hour).to eq 0
      end
    end

    describe "#minute" do
      it "returns zero" do
        expect(week_time.minute).to eq 0
      end
    end

    describe "#timestamp" do
      it "returns '00:00'" do
        expect(week_time.timestamp).to eq '00:00'
      end
    end
  end
end