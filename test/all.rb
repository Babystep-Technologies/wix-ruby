# include all *_test.rb files
# to run all tests: ruby -Itest test/all.rb

Dir[File.dirname(File.absolute_path(__FILE__)) + '/**/*_test.rb'].each {|file| require file }
