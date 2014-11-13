require 'rails_helper'

RSpec.describe Article, :type => :model do
  subject(:article) { FactoryGirl.create(:article) }

  it "validates presence of title" do
    article.title = ''
    expect(article).to validate_presence_of(:title)
  end

  it "validates uniqueness of title" do
    expect {
      FactoryGirl.create(:article, 2, title: 'title') 
    }.to raise_error { "Validation failed: Title has already been taken" }
  end

  it "validates presence of content" do
    article.content = ''
    expect(article).to validate_presence_of(:content)
  end

end
