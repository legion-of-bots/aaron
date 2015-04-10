describe Aaron::DSL do

  describe ".every" do

    it "should return a scheduler" do
      expect(subject.every(1)).to be_instance_of(Aaron::Scheduler)
    end

  end

end
