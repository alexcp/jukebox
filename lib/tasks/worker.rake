namespace "worker" do
  desc "Run background jobs until the queue is empty"
  task :empty_queue => :environment do
    jobs_count = QC.count
    p "#{jobs_count} jobs to process..."
    if jobs_count > 0 
      worker = BackgroundWorker.new
      worker.work until QC.count == 0
    end
  end
end
