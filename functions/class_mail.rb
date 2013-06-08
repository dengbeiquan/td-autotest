#encoding:utf-8
require 'mail'
class MailSender
	def send_mail(title,content)
		puts "sending mail..."
		i = 1
		begin
			smtp = {
			:address => 'smtp.gmail.com', :port => 25, :domain => 'google.com', :user_name => MAIL_SENDER, :password => MAIL_SENDER_PW, :authentication =>nil, :enable_starttls_auto => true }
			Mail.defaults { delivery_method :smtp, smtp }
			mail = Mail.new do
				from MAIL_SENDER
				to MAIL_ACCEPTER
				subject title
				body content
			end
			mail.charset = 'UTF-8'
			mail.deliver!
			puts "mail has been send"
		rescue
			puts $!.to_s
			$logger.debug("sending mail err: #{$!.to_s.gusb(/'"/,' ')} for=>	#{title}, #{content}") if i==2
			if(i<2) # retry 1 times
				i += 1
				retry
			end
		end
	end
end

# MAIL_ACCEPT = ['a_reg_1328498149_per@hotmail.com']
# MAIL_SENDER = 'tdautotestsender@gmail.com'
# MAIL_SENDER_PW = 'DDDapple158aaa'
# puts res=['你好 baby,what is your name','boy, my name is baby','girl'].join("\n")
# m = MailSender.new
# m.send_mail("hello world",res)
# puts "end"
# sleep 5