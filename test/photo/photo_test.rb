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

  def test_that_search_settings_work
    VCR.use_cassette('search_settings', :record => :new_episodes) do

      per_page = rand(80)
      result = Pexels::Photo.search('love', per_page, 1)

      assert_operator result.length, :==, per_page

      assert result.kind_of?(Array)
      assert result.first.kind_of?(Pexels::Photo)
    end
  end

  def test_that_search_returns_more_than_one_photo
    VCR.use_cassette('search_photos', :record => :new_episodes) do
      result = Pexels::Photo.search('surfing waves')

      assert_operator result.length, :>, 1

      assert result.kind_of?(Array)
      assert result.first.kind_of?(Pexels::Photo)
    end
  end

  def test_it_gives_curated_collection
   VCR.use_cassette('curated_photos', :record => :new_episodes) do
     result = Pexels::Photo.curated

     assert_operator result.length, :>, 1

     assert result.kind_of?(Array)
     assert result.first.kind_of?(Pexels::Photo)
   end
  end

  def test_it_gives_back_a_random_photo
   VCR.use_cassette('random_photo', :record => :new_episodes) do
     photo = Pexels::Photo.random
     assert_equal Pexels::Photo, photo.class
     assert photo.id != ""
     assert photo.url != ""
     assert photo.photographer != ""
     assert photo.photographer_url != ""
     assert photo.width != ""
     assert photo.height != ""
   end
  end

end
