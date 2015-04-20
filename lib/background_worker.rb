class BackgroundWorker < QC::Worker
  def handle_failure(job, e)
    $stderr.puts("job failed: #{job} exception: #{e.message}")
    QC.delete(job[:id])
  end
end
