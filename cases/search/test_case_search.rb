#encoding:utf-8
puts "start test case...."
require "./cases/inc.rb"
puts $case_name = "【test_search】"

# defined search class
class TestSearch
	def initialize()
		init
	end

 # assert
	def asserts_search_by_model_ok
		# model: P07-P3310	
		if $b.text.include?('7.0" Multi-touch 2 SIM Android 2.3 SP6820 Tablet Phone w WiFi TV ')&&$b.ul(:class,"productlisting-ul").imgs.length==2
			puts "pass, search by model"
		else
			puts "fail, search by model"
			screenshot
			add_result("fail, the search function err")
		end
	end 
	
	def asserts_search_by_keyword_ok
		
		if $b.title.include?("android")
			puts "search by keyword title ok"
		else
			puts "searche by keyword title fail"
			add_result("searche by keyword title fail")
		end
		
		if $b.ul(:class,"productlisting-ul").imgs.length>48
			puts "no. assert ok"
		else
			puts "no. assert fail"
			add_result("no. assert fail")
		end
		
	end

	# case
	def main
		begin
			# search by model-- P07-P3310
			browse_to_home_page
			search_fill_the_keyword()
			search_btn_click
			asserts_search_by_model_ok
			
			# search by keyword -- android
			browse_to_home_page
			search_fill_the_keyword('android')
			search_btn_click
			asserts_search_by_keyword_ok
			
		rescue
			puts "Run case [#{$case_name}] Err:"+$!.to_s
			screenshot
			add_result("Run case err in case [#{$case_name}] , err message：#{$!.to_s}")
		ensure
			teardown
		end
	end	# end case
end	# edn class
testsuite_search = TestSearch.new
testsuite_search.main
# sleep 3