module ErrorMessagesHelper
  def error_messages_for(*args)
    options = args.extract_options!
    first = args.compact.first
    model = first.model_name.human.downcase
    error_count = first.errors.messages.size

    action = options[:action] || t('activerecord.actions.saved')
    title = options[:title] || t('errors.template.title_with_action', model: model, action: action, count: error_count)
    message = options[:message] || t('errors.template.message')
    messages = args.compact.map { |o| o.errors.full_messages }.flatten

    return if messages.empty?

    content_tag(:article, class: 'message is-danger form-errors') do
      p_header = content_tag(:p, title)
      header = content_tag(:div, p_header, class: 'message-header')
      list_items = messages.map { |msg| content_tag(:li, msg) }
      list = content_tag(:ul, list_items.join.html_safe)
      p_message = content_tag(:p, "#{message}:")
      content = content_tag(:div, p_message + list, class: 'content')
      body = content_tag(:div, content, class: 'message-body')
      header + body
    end
  end

  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)
