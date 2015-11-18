require 'fileutils'

class LogCleaner
  include Sidekiq::Worker
  def perform(args, count)
    dir = args['dir']
    accepted_formats = args['accepted_formats']
    num_days = args['num_days']
    puts "------------------------"
    puts args.inspect
    puts "------------------------"
    #accepted_formats = %W(.log .txt)
    #logger.debug("Performing Sidekiq task)
    # read and process files from log directory
    Dir.foreach(dir) do |item|
      next if item == '.' or item == '..'
      #puts item
      #binding.pry
      if accepted_formats.include?(File.extname("#{dir}/#{item}"))
        file = File.open("#{dir}/#{item}")
        age = (Time.now.to_date - file.ctime.to_date).to_i
        if age >= num_days
          logger.debug "removing file - #{item}"
          FileUtils.remove(file)
        else
          logger.debug "Not removing file - #{item}, age = #{age}"
        end
      end
    end
    # do work on real items
  end
end
