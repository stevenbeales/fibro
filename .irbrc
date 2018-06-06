# frozen_string_literal: true

require "irb/completion"
require "irb/ext/save-history"
IRB.conf[:SAVE_HISTORY] = 10_000

# and for awesome print
require "awesome_print"
AwesomePrint.irb!
