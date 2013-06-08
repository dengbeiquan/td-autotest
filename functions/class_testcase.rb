class TestCase
	def initialize
		begin
			$case_name = 'case_name_no_set' if $case_name.nil
			$m = MailSender.new
			$logger = Log.new
			$result = []
			# check arguments for browser or headless(linux) specification
			ARGV.each { |arg|
				if arg.downcase.include? 'chrome'
						$browser = 'chrome'
				elsif arg.downcase.include? 'firefox'
						$browser = 'firefox'
				elsif arg.downcase.include? 'ff'
						$browser = 'firefox'
				elsif arg.downcase.include? 'ie'
						$browser = 'ie'
				elsif arg.downcase.include? 'headless'
						$headless = true
				end}
			####
			$browser = 'firefox' if $browser.nil?
			$site = 'http://www.samchen.info' if $site.nil?
			if $headless
				require 'headless'
				$headless = Headless.new
				$headless.start
			end
			if $browser == 'chrome'
				$b = Watir::Browser.new :chrome
				#$b = Watir::Browser.new :chrome, :switches => %w[--proxy-server=192.168.0.50:12001]
			elsif $browser == 'firefox'
				$b = Watir::Browser.new :firefox, :profile => 'default'
				# profile = Selenium::WebDriver::Firefox::Profile.new
				# profile.proxy = Selenium::WebDriver::Proxy.new :http => 'myproxy.com:8080', :ssl => 'myproxy.com:8080'
				# $b = Watir::Browser.new :firefox, :profile => profile
			elsif $browser == 'ie'
				$b = Watir::Browser.new :ie
			end
		rescue
			puts "initialize err: #{$!.to_s}"
			add_result("err message: #{$!.to_s}")
		end	
	end	# end init

	# teardown
	def teardown
		begin
			$b.close
			puts "borwser closed"
			if $headless
					$headless.destroy
			end
			if($result.length != 0)
				$result = $result.join("\n")
				$m.send_mail("#{$case_name} Err",$result)
			end
		rescue
			puts "teardown err"
			#$result = []
			add_result("teardown err, err message: "+$!.to_s)
			puts $result = $result.join("\n")
			$logger.debug($result)
			$m.send_mail("#{$case_name} Err",$result)
		ensure
			$logger.close
		end
	end

	# 如果页面出现超时，则重新加载,超过3次，则跳出该循环
	def load_link(waittime)
		times = 1
		begin
			Timeout::timeout(waittime)	do
			yield
		end
		rescue Timeout::Error => e
			puts "Page load timed out: #{e}"
			if(times<3)
				times+=1
				retry
			else
				add_result("err message: #{$!.to_s}")
			end
		end
	end

	# screenshot
	def screenshot(msg='')
		time = Time.new.strftime('%Y%m%d_%H%M%S')
		pic_name = time + '_' + $case_name	+ '_' + msg + '.png'
		#$b.driver.save_screenshot(File.dirname(__FILE__) + '/screenshots/' + $case_name + '_' + time.strftime('%Y%m%d_%H%M%S') + '.png')
		$b.driver.save_screenshot('./log/screenshots/'+pic_name)
		puts "screenshot ok !"
	end

	def add_result(e_msg='add result argument need, but missing')
		time = Time.new.strftime('%Y%m%d_%H%M%S')
		$result += ["#{time}, #{e_msg}"]
	end
end

 # puts "绝对路径"+File.expand_path(File.join(File.dirname(__FILE__), "/cases/file/test_case_*.rb"))
 # puts "相对路径"+File.join(File.dirname(__FILE__), "/cases/file/test_case_*.rb")