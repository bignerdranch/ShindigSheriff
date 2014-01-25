step "this user exists:" do |table|
  user_info = {}
  table.hashes.each { |t| user_info[t["ID"]] = t["Input"] }
  @existing_user = User.new(user_info)
  @existing_user.roles << Role.find_or_create_by(name: "finance approver")
  @existing_user.save!
end 

