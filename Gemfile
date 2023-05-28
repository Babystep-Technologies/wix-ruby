source "https://rubygems.org"

# Specify your gem's dependencies in wix-ruby.gemspec
gemspec

gem "rake", "~> 12.0"

group :development do
  gem "shoulda-context", "2.0.0"
  gem "test-unit"
  gem "pry"

  # Version doesn't matter that much, but this one contains some fixes for Ruby
  #   # 2.7 warnings that add noise to the test suite.
  gem "webmock", ">= 3.8.0"
end
