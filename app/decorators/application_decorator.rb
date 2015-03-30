class ApplicationDecorator < Draper::Decorator

  def title
    model.name + "-" + model.id unless model.has_attribute?(:title)
  end

end