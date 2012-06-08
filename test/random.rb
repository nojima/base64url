require 'test/unit'
require '../lib/base64url'

class Base64URLTest < Test::Unit::TestCase
  def setup
    srand(12345)
  end

  def test_base64url
    1000.times do
      random_string = Array.new(rand(1000)){ rand(0x100000000) }.pack('I*')
      encoded_string = Base64URL.encode(random_string)
      assert_match(/\A[-0-9A-Za-z_]*\Z/, encoded_string)
      decoded_string = Base64URL.decode(encoded_string)
      assert_equal(random_string, decoded_string)
    end
  end
end
