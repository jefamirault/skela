class Sound < ActiveRecord::Base

  validate :file_size, :sound_file_extensions


  def initialize(params = {})
    params ||= {}
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.content_type = @file.content_type
      self.file_contents = @file.read
      save
    end
  end

  def update(params = {})
    params ||= {}
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.content_type = @file.content_type
      self.file_contents = @file.read
      save
    end
  end

  private

  def sanitize_filename(filename)
    # Get only the filename, not the whole path (for IE)
    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    return File.basename(filename)
  end

  NUM_BYTES_IN_MEGABYTE = 1048576
  MAX_MEGABYTES = 8
  def file_size
    if @file && (@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > MAX_MEGABYTES
      errors.add(:file, "File size cannot be over #{MAX_MEGABYTES} megabytes.")
    end
  end

  def sound_file_extensions
    if @file &&  @file.content_type.split('/').first != 'audio'
      errors.add(:file, 'Must be an audio file.')
    end
  end
end
