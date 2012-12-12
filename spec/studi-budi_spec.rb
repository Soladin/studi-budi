require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "StudiBudi" do
  # it "fails" do
  #   fail "hey buddy, you should probably rename this file and start specing for real"
  # end
  before do
    @study_helper = StudiBudi.new
  end

  it "should get the user's input" do
    @study_helper.stub!(:gets) {"1"} # @study_helper.action.should eq 
    @study_helper.should_receive(:create)
  end

  it "should begin adding cards after creating a collection" do
    @study_helper.create.should_receive(:adding_cards)
  end

  # "if I make a card collection called 'Potatos'" do
  #   adfld.@collection_name should_eq "Potatos"
  # end

  # I "should say I'm sorry I didn't finish this. I spent all my time on the .rb and that first test" do
  #   @sol.apology.should eq "Please forgive me"
  # end
end
