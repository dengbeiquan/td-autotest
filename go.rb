# encoding: utf-8
#Dir.glob(File.join(File.dirname(__FILE__), 't*.rb')).each {|f| require f }
folder = ['login']  # need to run
#folder = ['login','register','search']
folder.each {|fo|
  Dir.glob(File.join(File.dirname(__FILE__), "/cases/#{fo}/test_case_*.rb")).each {|f| system "ruby #{f} " }
}
puts "script end"

 # sleep 3
