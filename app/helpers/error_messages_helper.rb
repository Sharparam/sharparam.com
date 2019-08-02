# frozen_string_literal: true

# Contains helper methods for rendering form error messages.
module ErrorMessagesHelper
  def error_messages_for(*args)
    options, model, error_count = parse_args args

    title = extract_title options, model, extract_action(options), error_count
    message = extract_message options
    messages = extract_messages args

    return if messages.empty?

    error_content title, message, messages
  end

  # Contains extensions to the FormBuilder for printing error messages.
  # rubocop:disable Rails/HelperInstanceVariable
  module FormBuilderAdditions
    def error_messages(options = {})
      @template.error_messages_for(@object, options)
    end
  end
  # rubocop:enable Rails/HelperInstanceVariable

  private

  def parse_args(args)
    options = args.extract_options!
    first = args.compact.first

    [
      options,
      first.model_name.human.downcase,
      first.errors.messages.size
    ]
  end

  def extract_action(options)
    options[:action] || t('activerecord.actions.saved')
  end

  def extract_title(options, model, action, error_count)
    options[:title] || t('errors.template.title_with_action', model: model, action: action, count: error_count)
  end

  def extract_message(options)
    options[:message] || t('errors.template.message')
  end

  def extract_messages(args)
    args.compact.map { |o| o.errors.full_messages }.flatten
  end

  def error_content(title, message, errors)
    content_tag(:article, class: 'message is-danger form-errors') do
      p_header = content_tag(:p, title)
      header = content_tag(:div, p_header, class: 'message-header')
      list_items = errors.map { |msg| content_tag(:li, msg) }
      list = content_tag(:ul, list_items.join)
      p_message = content_tag(:p, "#{message}:")
      content = content_tag(:div, p_message + list, class: 'content')
      body = content_tag(:div, content, class: 'message-body')
      header + body
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, ErrorMessagesHelper::FormBuilderAdditions)