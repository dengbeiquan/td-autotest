# require 'yaml'
# s = YAML.load(File.open("y.yaml"))
# puts s['student2'][1]
require 'yaml'
# configuration = { 'color' => 'blue',
#                   'font' => 'new romain',
#                   'font-size'  => 7 }
# open('text.cfg', 'w') { |f| YAML.dump(configuration, f) }

open('text.cfg') { |f| puts f.read }

open('text.cfg') { |f| puts YAML.load(f) }