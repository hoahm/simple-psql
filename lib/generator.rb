class Generator
  def self.phone_number
    '849%08d' % rand(8 ** 8)
  end
end
