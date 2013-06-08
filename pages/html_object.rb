def browse_to_home_page
  load_link($timeout_length){ $b.goto $site }
end

# function search
def fill_the_keyword(kw)
  $b.text_field(:id,"keyword").set kw
end
def search_button
  $b.div(:id,"form-btn").span
end
# end

# function language
def language_ru
  $b.a(:href,"#{$site}/index.php?main_page=index&disp_order=18&language=ru&change_lang=1").click
end
def language_en
  $b.a(:href,"#{$site}/index.php?main_page=index&disp_order=18&language=en&change_lang=1").click
end
# end 

# function login
def login_fill_the_form(email,pw)
  $b.text_field(:id,"login-email-address").set email
  $b.text_field(:id,"login-password").set pw
end
def login_link
  $b.div(:id,"tools-login").span.a
end
def login_ok_btn_value
  $b.div(:id,"tools-login").a.text
end
def login_fail_message
  sleep 2
  $b.div(:id,"columnCenter").div(:class,"error_box").span.text
end
def login_submit
  $b.text_field(:id,"login-password").send_keys :enter
end
# end 

# regmail
def mail_append(len)
  m_append=""
  1.upto(len){|i| m_append<<rand(10).to_s}
  return m_append
end

# get vcode
$i = 0
def get_vcode
    if $i==0
      puts "Please input vcode ..."
      $i+=1
    else 
      puts "Verification code error, please input vcode again..."
    end
    vcode="123456"
    $b.text_field(:id,"validateNum").set vcode
    $b.text_field(:id,"validateNum").send_keys :enter
    sleep(1)
end

# function register
def register_fill_the_form(email="td_auto_reg_#{mail_append(4)}@autoreg.com",pw='td123456',fname='td_auto',lname='reg')
  $b.text_field(:id,"login-email-address1").set email
  $b.text_field(:id,"first_name").set fname
  $b.text_field(:id,"last_name").set lname
  $b.text_field(:id,"login-password1").set pw
  $b.text_field(:id,"login-password-cnf").set pw
  puts "reg_mail: #{email}"
  # while $b.text_field(:id,"validateNum").exists?
    # get_vcode
  # end
end
def register_submit
  # if $b.text_field(:id,"validateNum").exists? == false
    # $b.text_field(:id,"login-password-cnf").send_keys :enter
  # end
  $b.text_field(:id,"login-password-cnf").send_keys :enter
end

# search
def search_select_list(val='')
  $b.select_list(:name,"categories_id").select_value(val)
end
def search_fill_the_keyword(kw='P07-P3310')
  $b.text_field(:id,"keyword").set kw
end
def search_btn_click
  $b.div(:id,"form-btn").click
end

# $5 zone, special, hot, new, top_brands 
def list_first_product
  $b.ul(:class,"tlisting-ul").div(:class,"p_box_wrapper").li.a.click
end

# common
def next_page
  $b.a(:class,"nextPage").click
end
def prev_page
  $b.a(:class,"prevPage").click
end

def verify_code_reg
   if $b.form(:id,"create_account").text_field(:id,"validateNum").exist?
     ver_no = $b.form(:id,"create_account").table(:class,"login_registe")[5][0].text
     # 获取数字放入数组并对其求和
     sum = eval ver_no.scan(/\d+/).join("+")
     $b.form(:id,"create_account").text_field(:id,"validateNum").set sum
   else
     puts "register there's no need to verify"
   end
end
def login_is_need_verify
  return $b.form(:id,"logins").text_field(:id,"validateNum").exist?
end
def verify_code_login
   if login_is_need_verify
     ver_no = $b.form(:id,"logins").table(:class,"login_registe")[2][0].text
     # 获取数字放入数组并对其求和
     sum = eval ver_no.scan(/\d+/).join("+")
     $b.form(:id,"logins").text_field(:id,"validateNum").set sum
   else
     puts "login there's no need to verify"
   end
end

#puts "html object loaded Ok"

