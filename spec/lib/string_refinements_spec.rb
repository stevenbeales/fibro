# frozen_string_literal: false

require './lib/refinements/string_refinements'

using StringRefinements

RSpec.describe StringRefinements do
  describe '#camelize' do
    it 'should convert string_refinements to StringRefinements' do
      expect('string_refinements'.camelize).to eq 'StringRefinements'
    end

    it 'should convert StringRefinements to Stringrefinements' do
      expect('StringRefinements'.camelize).to eq 'Stringrefinements'
    end

    it 'should be opposite of snakecase' do
      expect('StringRefinements'.snake_case.camelize).to eq 'StringRefinements'
    end
  end

  describe '#indent' do
    it 'should indent the string by the given number of spaces' do
      expect("foo".indent(4)).to eq "    foo"
    end

    it 'should indent multiple lines line by line' do
      expect("foo\nbar\n".indent(2)).to eq "  foo\n  bar\n"
    end

    it 'should not indent blank lines' do
      expect("foo\n\nbar\n".indent(2)).to eq "  foo\n\n  bar\n"
    end

    it 'should not add whitespace at the end' do
      expect("foo\nbar".indent(2)).to eq "  foo\n  bar"
    end

    it 'should take an optional second argument which changes the character used for indentation' do
      expect("foo".indent(2, '.')).to eq "..foo"
    end
  end

  describe '#remove_first_line' do
    it 'should remove first line from multiple lines' do
      expect("foo\nbar\n".remove_first_line).to eq "bar\n"
    end

    it 'should not throw an error with an empty string' do
      expect { ''.remove_first_line }.not_to raise_error
    end

    it 'should return an empty string when given a carriage return' do
      expect('\n'.remove_first_line).to eq ''
    end

    it 'should return an empty string when given a tab' do
      expect('\t'.remove_first_line).to eq ''
    end
  end

  describe '#snake_case' do
    it 'should convert StringRefinements to string_refinements' do
      expect('StringRefinements'.snake_case).to eq 'string_refinements'
    end

    it 'should convert ConditionIntent to condition_intent' do
      expect('ConditionIntent'.snake_case).to eq 'condition_intent'
    end

    it 'should convert EverybodyHurtsIntent to everybody_hurts_intent' do
      expect('EverybodyHurtsIntent'.snake_case).to eq 'everybody_hurts_intent'
    end
  end
end
