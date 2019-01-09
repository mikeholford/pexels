require "./test/test_helper"

class PexelsPhotoTest < Minitest::Test
  def test_exists
    assert Pexels::Client
  end

end
