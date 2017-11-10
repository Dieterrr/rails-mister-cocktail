# encoding: utf-8
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 800, 600
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:10", radius: 20,
    width: 150, height: 150, crop: :thumb, gravity: :face
  end

  version :small_rounded do
    cloudinary_transformation effect: "brightness:10", radius: 20,
    width: 50, height: 50, crop: :thumb
  end
end
