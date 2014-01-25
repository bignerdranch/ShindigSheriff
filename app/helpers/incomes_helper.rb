module IncomesHelper

  def status_clarify(boolean)
    if boolean == true
      return 'verified'
    elsif boolean == false
      return 'rejected'
    else boolean == nil
      return 'pending'
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

