below  instroduce how to install an run the project

Windows
1. install railsinstaller-2.2.1.exe or other virsion, you can download it from
	-- http://rubyforge.org/frs/download.php/76862/railsinstaller-2.2.1.exe
2. checkout if the ruby env  is ok, you can use command
	-- ruby -v
3. install the needed gems, use the follow command
	-- install gem mail
4. config the project env
	-- goto the root of the project, change the arrary(file go.rb) for what you need to run
5. final, you can click start.bat to enjoy the tests.

Linux
1. install ruby use command
	-- sudo apt-get install ruby
2. install xvfb, use command
	-- sudo apt-get install xvfb
3. install gems needed, use command
	-- gem inatall watir-webdriver
	-- gem install mail
4. final, goto the root of the project, run the script, use command
	-- ruby go.rb