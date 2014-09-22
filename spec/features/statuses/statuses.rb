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

end
