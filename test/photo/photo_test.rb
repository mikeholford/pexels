require "./test/test_helper"

class PexelsPhotoTest < Minitest::Test
  def test_exists
    assert Pexels::Photo
  end

  def test_it_gives_back_a_single_photo
   VCR.use_cassette('one_photo') do
     photo = Pexels::Photo.get(1768754)
     assert_equal Pexels::Photo, photo.class

     assert_equal 1768754, photo.id
     assert_equal "https://www.pexels.com/photo/big-sky-countryside-couple-england-1768754/", photo.url
     assert_equal "Mike Holford", photo.photographer
     assert_equal "http://api-server.pexels.com/@mike-holford-826321", photo.photographer_url
     assert_equal 4032, photo.width
     assert_equal 3024, photo.height
   end
  end

  def test_it_returns_more_than_one_photo
    VCR.use_cassette('search_photos') do
      result = Pexels::Photo.search('surfing')

      # Make sure we get more than one result
      assert_operator result.length, :>, 1

      # Make sure that the JSON was parsed
      assert result.kind_of?(Array)
      assert result.first.kind_of?(Pexels::Photo)
    end
  end

end
