require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "StudiBudi" do
  # it "fails" do
  #   fail "hey buddy, you should probably rename this file and start specing for real"
  # end
  before do
    @study_helper = StudiBudi.new
  end

  it "should get the user's input" do
    @study_helper.stub!(:gets) {"phrase"} # @study_helper.action.should eq 
  end


  # "if I make a card collection called 'Potatos'" do
  #   adfld.@collection_name should_eq "Potatos"
  # end









end
