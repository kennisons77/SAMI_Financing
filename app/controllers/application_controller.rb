class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :model_name
  before_action :set_object
  before_action :set_parent
  before_action :objects_crumb
  before_action :object_crumb, only: :show
  before_action :edit_crumb, :only => [:edit, :update]
  before_action :new_crumb, :only => [:new, :create]
  before_action :delete_crumb,only: :delete
  #for devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :set_parent, if: :devise_controller?
  skip_before_action :objects_crumb, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :lender_id, :email, :password) }
  end

  protected

  def objects_crumb
    add_breadcrumb
    if @parent_class
      add_breadcrumb "All #{@parent_class.pluralize.upcase}", polymorphic_url(@parent_class.pluralize)
      add_breadcrumb instance_variable_get("@" + @parent_class).title, polymorphic_url(instance_variable_get("@" + @parent_class))
      add_breadcrumb @@mname.pluralize, polymorphic_url([@parent_class.to_sym,@@mname.pluralize.downcase])
    else
      add_breadcrumb "All #{@@mname.pluralize}", polymorphic_url(@@mname.pluralize.downcase)
    end
  end

  def object_crumb
    add_breadcrumb instance_variable_get("@" + @@mname.downcase).title,""
  end

  def edit_crumb
    add_breadcrumb "Edit #{@@mname}", ''
  end

  def new_crumb
    add_breadcrumb "Create a new #{@@mname}", ''
  end

  def delete_crumb
    delete_breadcrumb "Delete#{@@mname}", ''
  end

  #Dynamically sets the object for the controller
  def set_object
    if params.key?("id")
      object = Kernel.const_get(@@mname).find(params[:id])
      instance_variable_set("@#{@@mname.downcase}", object)
    end
  end

  #searches the Model:PARENT constant for a name that matches params with an id. The nsets an instance variable.
  def set_parent
    if Kernel.const_defined?@@mname
      if Kernel.const_get(@@mname)::PARENT
        Kernel.const_get(@@mname)::PARENT.each do |parent|
          if params.key?("#{parent}_id")
            instance_variable_set("@parent_class", parent)
            id = params["#{parent}_id"]
            p_object = Kernel.const_get(parent.classify).find(id)
            instance_variable_set("@#{parent.downcase}", p_object)
          end
        end
      end
    else
      add_breadcrumb @@mname.pluralize.upcase, polymorphic_url(@@mname.pluralize)
    end
  end

  def model_name
    @@mname =  controller_path.classify
  end

  def add_breadcrumb name="home", url = root_path
    @breadcrumbs ||= []
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [name, url]
  end

  def self.add_breadcrumb name, url, options = {}
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
    end
  end

  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path, alert: "Admin Login Required") : (redirect_to(root_path, alert: "Only admins may access that page.") unless current_user.admin?)
  end
end
