class Resource < ActiveRecord::Base
  belongs_to :course
  has_many :resource_inclusions
  has_many :resourcefuls, through: :resource_inclusions

  validate :file_size

  def update(params = {})
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.content_type = @file.content_type
      self.file_contents = @file.read
      save
    end
  end

  def remove_file
    self.filename = nil
    self.content_type = nil
    self.file_contents = nil
    save
  end

  private

  def sanitize_filename(filename)
    # Get only the filename, not the whole path (for IE)
    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    File.basename(filename)
  end

  NUM_BYTES_IN_MEGABYTE = 1048576
  MAX_MEGABYTES = 24
  def file_size
    if @file && (@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > MAX_MEGABYTES
      errors.add(:file, "File size cannot be over #{MAX_MEGABYTES} megabytes.")
    end
  end
end
