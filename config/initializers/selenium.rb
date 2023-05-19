require 'selenium-webdriver'

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.headless!

  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.default_driver = :selenium
