#encoding:utf-8
puts "start test case...."
require "./cases/inc.rb"
puts $case_name = "【test_register】"
# $now_path = Pathname.new(File.dirname(__FILE__)).realpath   # get the file's real path

# defined register class
class TestRegister
  def initialize()
    init
  end

 # assert
  def asserts_register_ok
    sleep 2
    if login_ok_btn_value == "[Logout]"
      puts "pass, register"
    else
      puts "fail, register"
      screenshot
      add_result("fail, can't the normal register.")
    end
  end  # end assert

  # case
  def main
    begin
    
      browse_to_home_page
      login_link.click
      register_fill_the_form()
      verify_code_reg
      register_submit
      asserts_register_ok
      
    rescue
      puts "Run case #{$case_name} Err:"+$!.to_s
      screenshot
      add_result(" Run case err in case #{$case_name} , err message：#{$!.to_s}")
    ensure
      teardown
    end
  end  # end case
end  # edn class
testsuite_register = TestRegister.new
testsuite_register.main
# sleep 3