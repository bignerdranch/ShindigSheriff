module IncomesHelper

  def status_clarify(boolean)
    if boolean == nil
      return 'Pending'
    elsif boolean == true
      return 'Verified'
    else
      return 'Rejected'
    end
  end

end

