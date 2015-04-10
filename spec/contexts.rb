shared_context "a config file exists", config_file_exists: true do

  let(:config_file_path) { "~/aaron.rb" }

  around :each do |example|
    MemFs.activate do
      FileUtils.mkdir_p(File.dirname(config_file_path))
      FileUtils.touch(config_file_path)
      example.run
    end
  end

end

shared_context "a config file does not exist", config_file_exists: false do

  around :each do |example|
    MemFs.activate do
      example.run
    end
  end

end
