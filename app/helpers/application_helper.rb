# frozen_string_literal: true

# Contains application-level helpers.
module ApplicationHelper
  def active_link_to(*args, &block)
    index = block_given? ? 1 : 2
    args[index] ||= {}
    args[index][:class_active] ||= 'is-active'
    super(*args, &block)
  end

  def title(text)
    content_for(:title, " - #{text}")
  end

  def body_classes(*classes)
    content_for :body_classes, classes.join(' ')
  end

  def vertical_form_for(object, *args, &block)
    simple_form_for object, *args, &block
  end

  def horizontal_form_for(object, *args, &block)
    options = args.extract_options!
    horizontal_opts = {
      wrapper: :horizontal,
      wrapper_mappings: {
        boolean: :horizontal_checkbox,
        radio_buttons: :horizontal_radio_buttons,
        select: :horizontal_select
      }
    }
    merged = options.merge horizontal_opts
    simple_form_for object, *(args << merged), &block
  end

  def markdown(text)
    Sharparam::Markdown.render(text)
  end
end
