class CruddyGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :layout_name, type: :string, default: 'crud'

  def create_controllers
    copy_file 'cruddy_controller.rb', 'app/controllers/cruddy_controller.rb'
  end
  
end
