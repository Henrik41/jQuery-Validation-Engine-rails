# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  
include CarrierWave::ImageOptimizer
   #Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  process :auto_orient # this should go before all other "process" steps
   process :optimize
  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end


  # Choose what kind of storage to use for this uploader:
  storage :aws
#  storage :file


  include CarrierWave::MimeTypes
  process :set_content_type
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Provide a default URL as a default if there hasn't been a file uploaded:
   def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
   ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
   "/assets/fallback/" + [version_name, "default.png"].compact.join('_')
   end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
   version :thumb do
     process :resize_to_fit => [200, 200]
   end
   
   
    version :big do    
        process :resize_to_fill => [552, 411]
        process crop: '552x411+0+0'
     end
   
   version :medium do
       process :resize_to_fit => [292, 204]
       process crop: '292x204+0+0'
    end
    
    version :mini do
        process :resize_to_fill => [100, 100]
        process crop: '100x100+0+0'
     end
     
     version :grid do    
         process :resize_to_fill => [192, 135]
         process crop: '192x135+0+0'
      end
      
     version :supermini do    
      process :resize_to_fill => [60, 60]
      process crop: '60x60+0+0'
     end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  
  private

    # Simplest way
    def crop(geometry)
      manipulate! do |img|      
        img.crop(geometry)
        img
      end    
    end


    
    
    # Resize and crop square from Center
    def resize_and_crop(size)  
      manipulate! do |image|                 
        if image[:width] < image[:height]
          remove = (image[:height] - 135).round 
          image.shave("0x#{remove}") 
        elsif image[:width] > image[:height] 
          remove = ((image[:width] - image[:height])/2).round
          image.shave("#{remove}x0")
        end
        image.resize("#{size}")
        image
      end
    end

end
