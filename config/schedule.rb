
# frozen_string_literal: true

set :environment, ENV['RAILS_ENV']

every :month, at: '4:30 am' do
  runner 'CarDepreciationJob.perform_later'
end
