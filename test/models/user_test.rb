# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'regular should not have admin role' do
    user = users(:regular)
    assert_not user.has_role? :admin
  end

  test 'admin should have admin role' do
    admin = users(:admin)
    assert admin.has_role? :admin
  end

  test 'role existence check should fail if user has no role' do
    assert_not users(:regular).has_role?
  end

  test 'any role check should succeed if user has role' do
    assert users(:admin).has_role?
  end
end
