class CruddyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)


  def create_controllers
    copy_file 'cruddy_controller.rb', 'app/controllers/cruddy_controller.rb'
    copy_file 'crud_controller.rb', "app/controllers/#{name}_controller.rb"
    gsub_file "app/controllers/#{name}_controller.rb", /(CrudController)/, "#{name.titleize}Controller"
    gsub_file "app/controllers/#{name}_controller.rb", /(:crud)/, ":#{name.singularize}"
  end

  def create_views
    directory 'cruddy', 'app/views/cruddy'
    directory 'crud', "app/views/#{name}"
  end
end
