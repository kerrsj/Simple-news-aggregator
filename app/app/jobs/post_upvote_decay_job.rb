class PostUpvoteDecayJob < ApplicationJob
  queue_as :default
  #self.queque_adapter = :inline

  after_perform do |job|
    # invoke another job at your time of choice 
    self.class.set(:wait => 1.hour).perform_later(job.arguments.first)
  #   if Control.first.post_decay_on
  #   	self.class.set(:wait => 
  #   		"#{Control.first.post_decay}").perform_later(job.arguments.first)
 	# end
  end

  def perform(*args)
		## Catch errors like nil case
  	posts = Post.where("cached_votes_up > 0")
  	
    	posts.each do |post|
    	
    		post.get_positives.first.destroy!
    	
    	end
  	end
	
end

PostUpvoteDecayJob.perform_now()