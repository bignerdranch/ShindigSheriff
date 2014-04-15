step "I am at the new organizations page" do
  visit new_user_organization_path(@user)
end

step "I am at the edit organization page" do
  visit edit_organization_path(@organization)
end

step "I am at the organization page" do
  visit organization_path(@organization)
end
