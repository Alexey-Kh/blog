require 'rails_helper'

RSpec.describe Article, :type => :model do
  subject(:article) { FactoryGirl.build(:article, title: 'BDD is fun') }

  it "should have :title attribute" do
    expect(article.attributes).to include('title')
  end

end
