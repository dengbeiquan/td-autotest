require "logger"
# DEBUG < INFO < WARN < ERROR < FATAL < UNKNOWN
class Log
  def defined_log
     if(defined? $log)==nil
      $log = Logger.new("./log/"+(Time.now).strftime('%Y%m%d_')+$case_name+".log",'daily')
      #$log = Logger.new('new.log','daily')
      $log.datetime_format = "%Y-%m-%d %H:%M:%S "
     end
  end
  def debug(e_msg='')
    defined_log
    $log.debug(e_msg)
  end
  def info(e_msg='')
    defined_log
    $log.info(e_msg)
  end
  def warn(e_msg='')
    defined_log
    $log.warn(e_msg)
  end
  def close
    $log.close if defined? $log
    #puts 'log file closed'
  end
end

# $logger = Log.new
# $logger.debug("你好")
# $logger.info("你好")
# $logger.warn("你好")
#$logger.close


# log
# $log.info("13213")
# $

# class Test
  # def log_test
    # $logger.info("test for class")
    # puts "class ok"
  # end
# end
# cl = Test.new
# cl.log_test

# log("baby")
# log("baby")
# log("baby")

  
