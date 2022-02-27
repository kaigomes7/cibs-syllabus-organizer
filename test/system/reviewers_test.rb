# frozen_string_literal: true

require 'application_system_test_case'

class ReviewersTest < ApplicationSystemTestCase
  setup do
    @reviewer = reviewers(:one)
  end

  test 'visiting the index' do
    visit reviewers_url
    assert_selector 'h1', text: 'Reviewers'
  end

  test 'creating a Reviewer' do
    visit reviewers_url
    click_on 'New Reviewer'

    fill_in 'Reviewer email', with: @reviewer.reviewer_email
    fill_in 'Tamu department', with: @reviewer.tamu_department_id
    click_on 'Create Reviewer'

    assert_text 'Reviewer was successfully created'
    click_on 'Back'
  end

  test 'updating a Reviewer' do
    visit reviewers_url
    click_on 'Edit', match: :first

    fill_in 'Reviewer email', with: @reviewer.reviewer_email
    fill_in 'Tamu department', with: @reviewer.tamu_department_id
    click_on 'Update Reviewer'

    assert_text 'Reviewer was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Reviewer' do
    visit reviewers_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Reviewer was successfully destroyed'
  end
end
