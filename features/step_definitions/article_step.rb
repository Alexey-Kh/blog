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

When(/^I fill in "(.*?)" with "(.*?)"$/) do |attribute, string|
  fill_in(attribute, with: string)
end

When(/^I click on "(.*?)"$/) do |text|
  click_on(text)
end

When(/^I go to article titled "(.*?)"$/) do |title|
  visit article_path(Article.find_by(title: title))
end

Then(/^I should have (\d+) article$/) do |num|
  expect(Article.count.to_s).to eq(num)
end

Then(/^I should see string "([^\""]*)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^I should see articles pagination$/) do
  expect(page).to have_css('div.pagination')
end

Then(/^I should see first (\d+) articles$/) do |num|
  articles = Article.all
  num.to_i.times do |n|
    expect(page).to have_content(articles[n].title)
  end
end

Then(/^I should see navigation bar with links: (.*?)$/) do |links|
  links.split(', ').each do |link|
    expect(page).to have_selector('a', text: link)
  end
end

Then(/^I should see sidebar with elements: (.*?)$/) do |elements|
  elements.split(', ').each do |element|
    expect(page).to have_css("#sidebar-#{element}")
  end
end

Then(/^I should see footer$/) do
  expect(page).to have_selector('footer')
end

Then(/^I should see "(.*?)" page$/) do |page|
  path = case page
  when "home"
    root_path
  when "About me"
    '/about_me'
  else 
    raise "Undefined page in article_step.rb"
  end
  expect(current_path).to eq path
end





