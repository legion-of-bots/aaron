describe Aaron::Aaron do
  subject { Aaron::Aaron }

  describe ".locate_config_file" do

    context "a config file does not exist", config_file_exists: false do
      it "should return nil" do
        expect(subject.locate_config_file).to be_nil
      end
    end

  end

  describe ".run" do

    context "a config file does not exist", config_file_exists: false do
      it "should throw an exception" do
        expect { subject.run }.to raise_error(Aaron::Errors::ConfigFileNotFound)
      end
    end

  end

end
