# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'regular should not have admin role' do
    user = users(:regular)
    assert_not user.role? :admin
  end

  test 'admin should have admin role' do
    admin = users(:admin)
    assert admin.role? :admin
  end

  test 'role existence check should fail if user has no role' do
    assert_not users(:regular).role?
  end

  test 'any role check should succeed if user has role' do
    assert users(:admin).role?
  end
end
