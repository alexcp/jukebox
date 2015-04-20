require 'queue_classic'

unless Rails.env.production?
  QC.default_conn_adapter = QC::ConnAdapter.new(ActiveRecord::Base.connection.raw_connection)
end
