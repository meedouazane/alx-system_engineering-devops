#!/usr/bin/env ruby
from = ARGV[0].scan(/from:\s*(\S+)\]\D/).join
to = ARGV[0].scan(/to:\s*(\S+)\]\D/).join
flags = ARGV[0].scan(/flags:\s*(\S+)\]\D/).join
all = "#{from},#{to},#{flags}"
puts all
