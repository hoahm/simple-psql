module DB
  class Seed
    def self.run
      schema_file = File.join(File.dirname(__FILE__), 'schema.sql')
      sql = File.read(schema_file)
      $conn.exec(sql)
    end
  end
end
