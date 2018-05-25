# frozen_string_literal: true

# Add methods to String class using refinements rather than monkey patching
module StringRefinements
  refine String do
    
    # CamelCases a snake_case string
    #
    # == Examples
    #
    #   "string_refinements".camelize # => "StringRefinements"
    #
    #   "StringRefinements".camelize # => "Stringrefinements"
    def camelize
      split("_").each(&:capitalize!).join("")
    end

    # Indent a multiline string
    #
    # == Attributes
    #
    #  * +amount+ - Number of characters to indent each line of string
    #  * +indent_string+ - Optional parameter. If blank, will pad with spaces. Otherwise will pad with indent_string.
    # 
    # == Examples
    #
    #   "Abc  
    #    def  
    #    ghi".indent(1) # =>  
    #  " Abc  
    #    def  
    #    ghi"   
    def indent(amount, indent_string = nil)
      indent_string = indent_string || self[/^[ \t]/] || " "
      re = /^(?!$)/
      gsub!(re, indent_string * amount)
      self
    end

    # Removes first line from a string
    #
    # == Examples
    #
    #   "Abc  
    #    def  
    #    ghi".remove_first_line # =>  
    #   "def  
    #    ghi"  
    def remove_first_line
      first_newline = (index("\n") || size - 1) + 1
      slice!(0, first_newline).sub("\n", '')
      self
    end

    # snake_cases a CamelCase string
    #
    # == Examples
    #
    #   "StringRefinements".snake_case # => "string_refinements"
    def snake_case
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr('-', '_')
        .gsub(/\s/, '_')
        .gsub(/__+/, '_')
        .downcase
    end
  end
end
