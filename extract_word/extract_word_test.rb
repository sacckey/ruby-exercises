require 'minitest/autorun'
require_relative './extract_word'

class ExtractWordTest < Minitest::Test
  def test_execute
ExtractWord.execute(input_file_path)
#    assert_equal expected_text, ExtractWord.execute(input_file_path)
  end

  private

  def input_file_path
    File.expand_path('../input.txt', __FILE__)
  end

  def expected_text
    file_path = File.expand_path('../expected_output.txt', __FILE__)
    File.read(file_path).strip
  end
end