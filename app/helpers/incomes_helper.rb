module IncomesHelper

  def status_clarify(boolean)
    if boolean == 'true'
      return 'verified'
    elsif boolean == 'false'
      return 'pending'
    else boolean == 'nil'
      return 'pending'
    end
  end

end

