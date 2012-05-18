# encoding: utf-8

class AvatarUploader < BaseUploader
  version :small do
    process :resize_to_fill => [20, 20]
  end

  version :normal do
    process :resize_to_fill => [48, 48]
  end

  version :large do
    process :resize_to_fill => [96, 96]
  end

  version :huge do
    process :resize_to_fill => [120, 120]
  end
end
