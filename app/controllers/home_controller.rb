# frozen_string_literal: true

# Controller for home pages and actions.
class HomeController < ApplicationController
  def index
    @socials = [
      { link: 'https://github.com/Sharparam', title: 'GitHub', class: 'fab fa-github-alt' },
      {
        link: 'https://stackoverflow.com/users/1104531/sharparam',
        title: 'Stack Overflow',
        class: 'fab fa-stack-overflow'
      },
      { link: 'https://twitter.com/Sharparam', title: 'Twitter', class: 'fab fa-twitter' },
      { link: 'https://www.linkedin.com/in/sharparam', title: 'LinkedIn', class: 'fab fa-linkedin-in' },
      { link: 'https://www.youtube.com/user/F16Gaming', title: 'YouTube', class: 'fab fa-youtube' },
      { link: 'mailto:adam.hellberg@sharparam.com', title: 'Email me!', class: 'fas fa-envelope' }
    ]
    render layout: 'landing'
  end

  def about; end
end
