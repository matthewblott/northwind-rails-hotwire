module ApplicationHelper
  def field(model, field_name)
    render("field", model: model, field_name: field_name)
  end
end
