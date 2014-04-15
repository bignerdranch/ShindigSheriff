class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def organizer?
    user.has_role?("organizer")
  end


  def finance_approver?
    user.has_role?("finance approver")
  end

  def verified?
    user.verified?
  end
end

