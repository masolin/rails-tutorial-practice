require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    before :all do
      @base_title = 'Ruby on Rails Practice Sample App'
    end

    it "returns the default title" do
      expect(helper.full_title).to eq(@base_title)
    end

    it "includes per page name" do
      expect(helper.full_title(assign(:title, 'About'))).to eq('About | ' + @base_title)
    end
  end
end
