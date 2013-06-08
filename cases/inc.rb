begin
	require "rubygems"	# for ruby 1.8.7
	require "watir-webdriver"
	# require "pathname"
	require "./config/config.rb"
	require "./functions/class_log.rb"
	require "./functions/class_testcase.rb"
	require "./functions/class_mail.rb"
	require "./pages/html_object.rb"
rescue LoadError
	e_msg = $!.to_s
	puts 'LoadError'+e_msg
end
