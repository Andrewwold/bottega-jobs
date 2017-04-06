class ScheduledJob
  include Delayed::RecurringJob
  run_every 1.hour
  # run_every 30.seconds
  timezone 'US/Mountain'
  def initialize
  end

  def perform
  	logger.info "Processing authentic jobs"
  	Api::AuthenticJob.parse(Api::AuthenticJob.get).each { |job|  j = JobPost.find_or_initialize_by(api_id: job['api_name'], api_name: job['api_name']) ; j.update_attributes(job) }
    logger.info "Processing github jobs"
    Api::Github.parse(Api::Github.get)
  end
  def error(job, exception)
    logger.info exception
  end
end