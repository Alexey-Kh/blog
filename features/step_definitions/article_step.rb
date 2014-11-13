Given(/^Blog has articles titled (.+)$/) do |titles|
  titles.split(', ').each do |title|
    FactoryGirl.create(:article, title: title)
  end
end

Given(/^I have no articles$/) do
  Article.delete_all
end

Given(/^I am on the list of articles$/) do
  visit(articles_path)
end

Given(/^I have article with title "(.*?)" and content "(.*?)"$/) do |title, content|
  FactoryGirl.create(:article, title: title, content: content)
end

When(/^I go to the list of articles$/) do
  visit(articles_path)
end

When(/^I follow "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |attribute, string|
  fill_in(attribute, with: string)
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

When(/^I go to article titled "(.*?)"$/) do |title|
  visit article_path(Article.find_by(title: title))
end

Then(/^I must have (\d+) article$/) do |num|
  expect(Article.count.to_s).to eq(num)
end

Then(/^I must see "([^\""]*)"$/) do |text|
  expect(page).to have_content(text)
end




