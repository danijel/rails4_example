require 'carrierwave/test/matchers'

describe AvatarUploader do
  include CarrierWave::Test::Matchers

  before do
    AvatarUploader.enable_processing = true
    user = FactoryGirl.create(:user)
    @uploader = AvatarUploader.new(user, :avatar)
    @uploader.store!(File.open(Rails.root.join("app/assets/images/avatar/thumb_default.jpeg")))
  end

  after do
    AvatarUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      @uploader.thumb.should have_dimensions(110, 110)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0666)
  end
end