require 'spec_helper'

describe "communities/edit" do
  before(:each) do
    @community = assign(:community, stub_model(Community,
      :name => "MyString"
    ))
  end

  it "renders the edit community form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => communities_path(@community), :method => "post" do
      assert_select "input#community_name", :name => "community[name]"
    end
  end
end
