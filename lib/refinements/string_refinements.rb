# frozen_string_literal: true

# Add methods to string
module StringRefinements
  refine String do
    def remove_first_line
      first_newline = (index("\n") || size - 1) + 1
      slice!(0, first_newline).sub("\n", '')
      self
    end

    def indent(amount, indent_string = nil)
      indent_string = indent_string || self[/^[ \t]/] || " "
      re = /^(?!$)/
      gsub!(re, indent_string * amount)
      self
    end
  end
end
