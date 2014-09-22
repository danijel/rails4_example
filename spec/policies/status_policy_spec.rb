describe StatusPolicy do
  subject { StatusPolicy }

  let(:status) { FactoryGirl.create(:status, user: current_user) }

  let (:current_user) { FactoryGirl.create :user }
  let (:other_user) { FactoryGirl.build_stubbed :user }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }

  permissions :update? do
    it "prevents updates for admin or other_user on statuses not created by them" do
      expect(subject).not_to permit(admin, status)
      expect(subject).not_to permit(other_user, status)
    end

    it "allows user to make updates to his own status" do
      expect(subject).to permit(current_user, status)
    end
  end

  permissions :destroy? do
    it "allows user to delete his own status" do
      expect(subject).to permit(current_user, status)
    end
    it "prevents other user to delete someone else's status" do
      expect(subject).not_to permit(other_user, status)
    end
    it "allows an admin to delete any status" do
      expect(subject).to permit(admin, status)
    end
  end

end
