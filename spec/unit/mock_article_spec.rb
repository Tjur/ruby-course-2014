require "./mock_article.rb"

class TestMockArticle < Test::Unit::TestCase

  def setup
    @art = MockArticle.new
  end

  def test_generate_author
    author = @art.generate_author
    assert_equal(author.split.size, 2)
    assert_equal(author.split.keep_if{ |s| s == s.capitalize }.size, 2)
  end

  def test_generate_title
    title = @art.generate_title
    assert_equal([1, 2, 3, 4, 5].member?(title.split.size), true)
    assert_equal(title[0] == title[0].capitalize, true)
  end

  def test_generate_sentence
    sentence = @art.generate_sentence
    assert_equal([5, 6, 7, 8, 9, 10].member?(sentence.split.size), true)
    assert_equal(sentence[0] == sentence[0].capitalize, true)
  end

  def test_generate_content
    content = @art.generate_content
    assert_equal([1, 2, 3, 4, 5].member?(content.split(".").size), true)
    assert_equal(content.split(".").keep_if{ |sent| [5, 6, 7, 8, 9, 10].member?(sent.split.size) }.size == content.split(".").size, true)
    assert_equal(content.split(".").keep_if{ |sent| sent[0] == sent[0].capitalize}.size == content.split(".").size, true)
  end
end
