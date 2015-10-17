class CruddyGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, type: :string, default: 'crud'

  copy_file
end
