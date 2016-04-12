#spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe 'online calculator' do
  it "should show the buttons at start" do
    get '/'
    expect(last_response.body).to include("button")
  end
end
