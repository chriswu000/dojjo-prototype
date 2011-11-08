require 'spec_helper'

describe "items/show.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :entry_id => 1,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
