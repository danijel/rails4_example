include Warden::Test::Helpers
Warden.test_mode!

feature 'Statuses crud' do

  after(:each) do
    Warden.test_reset!
  end

  given (:user) { FactoryGirl.create :user }

  # Scenario: Statuses listed on status index page
  #   Given I am signed in
  #   When I visit the statuses index page
  #   Then I see all statuses
  scenario 'user sees all statuses' do
    s1 = FactoryGirl.create(:status, user: user)
    s2 = FactoryGirl.create(:status, user: user)
    login_as(user, scope: :user)
    visit statuses_path
    expect(page).to have_content s1.status
    expect(page).to have_content s2.status
  end

  scenario 'from status index to new status page' do
    login_as(user, scope: :user)
    visit statuses_path
    click_link('New Status')
    expect(page).to have_content 'New status'
  end

  scenario 'creation of status leads to show page' do
    login_as(user, scope: :user)
    sentence = Faker::Lorem.sentence
    visit new_status_path
    page.has_field?('textarea')
    page.has_button?('Save')
    fill_in('Status', with: sentence)
    click_button 'Save'
    page.has_link?('Edit')
    expect(page).to have_content sentence
  end

  scenario 'from show page to edit page' do
    login_as(user, scope: :user)
    status = FactoryGirl.create(:status, user: user)
    visit edit_status_path(status)
    expect(page).to have_content 'Editing status'
  end

  scenario 'edit status' do
    login_as(user, scope: :user)
    status = FactoryGirl.create(:status, user: user)
    visit edit_status_path(status)
    sentence = "Test " << Faker::Lorem.sentence
    fill_in('Status', with: sentence)
    click_button 'Save'
    expect(page).to have_content sentence
  end

end
