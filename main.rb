require File.expand_path('../config/application', __FILE__)
require File.expand_path('../db/seed', __FILE__)
Dir[__dir__ + '/lib/**/*.rb'].each { |f| require f }

MAX_RECORDS = 10_000_000

# Create database
DB::Seed.run

# Seed data
def create_lead(num = 0)
  puts num
  year_ago = num % 9
  time = Time.now - (year_ago * 365 * 86400)
  phone_number = Generator.phone_number

  sql = 'INSERT INTO leads (phone_number, created_at, updated_at) VALUES ($1, $2, $3)'
  stmt = "stmt_#{num}"
  $conn.prepare(stmt, sql)
  $conn.exec_prepared(stmt, [phone_number, time, time])
end

def main
  cnt = 0
  lock = Mutex.new

  while (cnt <= MAX_RECORDS) do
    lock.synchronize do
      thread = Thread.new do
        create_lead(cnt)
      end
      thread.join
      cnt += 1
    end
  end
end

print_memory_usage do
  print_time_spent do
    main
  end
end
