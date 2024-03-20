module ApplicationHelper
  def text_field(model, field_name)
    render("text_field", model: model, field_name: field_name)
  end

  def date_field(model, field_name)
    render("date_field", model: model, field_name: field_name)
  end

  def email_field(model, field_name)
    render("email_field", model: model, field_name: field_name)
  end
end
