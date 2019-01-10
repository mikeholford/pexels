require "./test/test_helper"

class PexelsVideoTest < Minitest::Test
  def test_exists
    assert Pexels::Video
  end

  def test_that_search_returns_more_than_one_video
    VCR.use_cassette('search_videos', :record => :new_episodes) do
      result = Pexels::Video.search('nature')
      assert_operator result.length, :>, 1
      assert result.kind_of?(Array)
      assert result.first.kind_of?(Pexels::Video)
    end
  end

  def test_that_search_settings_work
    VCR.use_cassette('search_settings_video', :record => :new_episodes) do
      per_page = rand(80)
      result = Pexels::Video.search('love', per_page, 1)
      assert_operator result.length, :<=, per_page 
      assert result.kind_of?(Array)
      assert result.first.kind_of?(Pexels::Video)
    end
  end

end
