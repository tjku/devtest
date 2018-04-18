require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

# https://github.com/vcr/vcr/wiki/Automatically-record-all-remote-calls-(with-RSpec)
RSpec.configure do |config|
  # Add VCR to all tests
  config.around(:each) do |example|
    vcr_tag = example.metadata[:vcr]

    if vcr_tag == false
      VCR.turned_off(&example)
    else
      options = vcr_tag.is_a?(Hash) ? options : {}
      path_data = [example.metadata[:description]]
      parent = example.example_group
      while parent != RSpec::ExampleGroups
        path_data << parent.metadata[:description]
        parent = parent.parent
      end

      name = path_data.map{|str| str.underscore.gsub(/\./,'').gsub(/[^\w\/]+/, '_').gsub(/\/$/, '')}.reverse.join('/')

      VCR.use_cassette(name, options, &example)
    end
  end
end 
