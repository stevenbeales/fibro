# frozen_string_literal: true

# Add methods to String class without monkey patching
module StringRefinements
  refine String do
    def camelize
      split("_").each(&:capitalize!).join("")
    end

    def indent(amount, indent_string = nil)
      indent_string = indent_string || self[/^[ \t]/] || " "
      re = /^(?!$)/
      gsub!(re, indent_string * amount)
      self
    end

    def remove_first_line
      first_newline = (index("\n") || size - 1) + 1
      slice!(0, first_newline).sub("\n", '')
      self
    end

    def snakecase
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr('-', '_')
        .gsub(/\s/, '_')
        .gsub(/__+/, '_')
        .downcase
    end
  end
end
