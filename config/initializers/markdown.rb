# frozen_string_literal: true

module Sharparam
  # Contains markdown code.
  module Markdown
    class << self
      def render(text)
        # rubocop:disable Rails/OutputSafety
        create_markdown.render(text).html_safe
        # rubocop:enable Rails/OutputSafety
      end

      private

      def create_renderer
        Redcarpet::Render::HTML.new(with_toc_data: true)
      end

      def create_markdown
        @create_markdown ||= Redcarpet::Markdown.new(
          create_renderer,
          autolink: true,
          fenced_code_blocks: true,
          footnotes: true,
          highlight: true,
          lax_html_blocks: true,
          no_intra_emphasis: true,
          quote: true,
          space_after_headers: true,
          strikethrough: true,
          superscript: true,
          tables: true,
          underline: true
        )
      end
    end
  end
end
