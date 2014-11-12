Given(/^Blog has articles titled (.+)$/) do |titles|
  titles.split(', ').each do |title|
    Article.create!(title: title)
  end
end

Given(/^I have no articles$/) do
  Article.delete_all
end

Given(/^I am on the list of articles$/) do
  visit(articles_path)
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

Then(/^I must have (\d+) article$/) do |num|
  expect(Article.count.to_s).to eq(num)
end

Then(/^I must see "([^\""]*)"$/) do |text|
  expect(page).to have_content(text)
end



