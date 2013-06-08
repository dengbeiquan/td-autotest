#encoding:utf-8
puts "start test case...."
require "./cases/inc.rb"
puts $case_name = "【test_login】"
# $now_path = Pathname.new(File.dirname(__FILE__)).realpath	 #get the real path
# 定义注册类
class TestLogin < TestCase

	# 断言
	def asserts_login_ok
		if login_ok_btn_value == "[Logout]"
			puts "right pw case is ok"
		else
			puts "right pw case fail"
			screenshot('right_pw_login_case_fail')
			add_result("login by right password case fail, can\'t login by right password, please check the login function")
		end
	end
	
	def asserts_login_fail
		login_fail_message_expect = "Sorry, there is no match for that email address and/or password."
		if login_fail_message == login_fail_message_expect
			puts "wrong pw case is ok"
		else
			puts "wrong pw case fail"
			screenshot('wrong_pw_login_case_fail')
			add_result("login by wrong password case fail, expect message \n (#{login_fail_message_expect}),but actual \n (#{login_fail_message})")
		end
	end
	
	def asserts_login_show_verify_code_ok
		if login_is_need_verify
			puts "verify code show ok"
		else
			puts "verify code show fail"
			add_result("verify code show fail, use wrong password login 3 times, but no show the verify code. please checkout the verify function")
		end
	end

	# 用例 
	def main
		begin
		
			browse_to_home_page
			# wrong pw login case
			3.times{
				login_link.click
  			login_fill_the_form("dengbeiquan@gmail.com","xxxxxx")
  			login_submit
			}
			asserts_login_fail
			sleep 1
			asserts_login_show_verify_code_ok
			#sleep 0.5
			
			# right pw login case
			login_link.click
			login_fill_the_form("dengbeiquan@gmail.com","123456")
			verify_code_login
			login_submit
			asserts_login_ok
			
		rescue
			puts "Run case #{$case_name} Err: "+$!.to_s
			screenshot('run_case_err')
			add_result("Run case #{$case_name} Err: "+$!.to_s)
		ensure
			teardown
		end
		
	end
 
end
testsuite_login = TestLogin.new
testsuite_login.main
