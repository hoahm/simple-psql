begin
  $conn = PG.connect(dbname: ENV['DB_NAME'],
                     user: ENV['DB_USERNAME'],
                     password: ENV['DB_PASSWD'],
                     port: ENV.fetch('DB_PORT', '5432'),
                     host: ENV.fetch('DB_HOST', '127.0.0.1'))
  puts "Connected to database #{$conn.db}!"
rescue PG::Error => e
  puts "Fail to connect to database #{ENV['DB_NAME']}!"
  puts e.message
end
