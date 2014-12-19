Given(/^Blog has articles titled (.+)$/) do |titles|
  titles.split(', ').each do |title|
    FactoryGirl.create(:article, title: title)
  end
end

Given(/^I have no articles$/) do
  Article.delete_all
end

Given(/^I am on the home page$/) do
  visit(root_path)
end

Given(/^I have article with title "(.*?)" and content "(.*?)"$/) do |title, content|
  FactoryGirl.create(:article, title: title, content: content)
end

Given(/^Blog has (\d+) articles$/) do |num|
  num.to_i.times do
    FactoryGirl.create(:article)
  end
end

When(/^I go to the home page$/) do
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

Then(/^I must see string "([^\""]*)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I must see articles pagination$/) do
  expect(page).to have_css('div.pagination')
end

Then(/^I must see first (\d+) articles$/) do |num|
  articles = Article.all
  num.to_i.times do |n|
    expect(page).to have_content(articles[n].title)
  end
end




