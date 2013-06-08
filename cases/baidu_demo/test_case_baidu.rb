#encoding:utf-8
require './cases/inc.rb'
$case_name = "【baidu_search】"

class TestBaidu < TestCase

	def assert_ok
		if $b.text.include?("the most elegant way to use")
			puts "case is ok"
		else
			screenshot('assert_fail')
			puts "case fail"
			add_result("")
		end
	end
	def main
		begin
			$b.goto "http://www.baidu.com"
			$b.text_field(:id,"kw").set "watir-webdriver"
			$b.send_keys :enter
			assert_ok
		rescue
			puts "run case err"+$!.to_s
			screenshot('run case err')
			add_result('run case err: '+$!.to_s)
		ensure
			teardown
		end
	end
end

ba=TestBaidu.new
ba.main