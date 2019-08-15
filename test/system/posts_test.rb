# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @user = users(:admin)
    @post = posts(:one)
    sign_in @user
  end

  test 'visiting the index' do
    visit posts_url
    assert_selector 'h1', text: 'Posts'
  end

  test 'creating a Post' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Body', with: @post.body
    fill_in 'Description', with: @post.description
    fill_in 'Title', with: @post.title
    fill_in 'Draft', with: @post.draft
    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'updating a Post' do
    visit posts_url
    click_on 'Edit', match: :first

    fill_in 'Body', with: @post.body
    fill_in 'Description', with: @post.description
    fill_in 'Title', with: @post.title
    fill_in 'Draft', with: @post.draft
    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully deleted'
  end
end
