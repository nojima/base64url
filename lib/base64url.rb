# The Base64URL module provides for the encoding and decoding method using base64url representation.
module Base64URL
  module_function

  # Returns the base64url-encoded version of +bin+.
  def encode(bin)
    [bin].pack('m0').gsub(/\=+\Z/, '').tr('+/', '-_')
  end

  # Returns the base64url-decoded version of +bin+.
  def decode(bin)
    m = bin.size % 4
    bin += '=' * (4 - m) if m != 0
    bin.tr('-_', '+/').unpack('m0').first
  end
end
