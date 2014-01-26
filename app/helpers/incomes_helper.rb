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

  def status_update(boolean)
    if boolean == true
      boolean = false
    elsif boolean == false
      boolean = true
    end
  end

end

