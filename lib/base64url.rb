#
# = base64url.rb: methods for base64url-encoding and -decoding strings
#

# The Base64URL module provides for the encoding and decoding of binary data
# using a base64url representation.
#
# base64url encoding is Base64 for URLs and filenames.
# base64url's 62nd and 63rd chars are '-' and '_'.
# base64url does not have pad chars '='.
#
# == Example
#
# A simple encoding and decoding.
#
#     require "base64url"
#
#     enc   = Base64URL.encode('Send reinforcements')
#                         # -> "U2VuZCByZWluZm9yY2VtZW50cw"
#     plain = Base64URL.decode(enc)
#                         # -> "Send reinforcements"
#

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
