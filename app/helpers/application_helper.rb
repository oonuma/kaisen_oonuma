module ApplicationHelper
  def new_child_fields(form_builder, method, options={})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end

  def add_child_link(name, f, method, options={}, options_for_new_child_fields={})
    fields = new_child_fields(f, method, options_for_new_child_fields)
    link_to(name, "#", :onclick => "insert_fields(this, \"#{method}\",\"#{escape_javascript(fields)}\")")
  end
end
