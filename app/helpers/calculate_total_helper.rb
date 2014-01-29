module CalculateTotalHelper

  def estimated_total(items)
    items.sum(:estimated_amount)
  end

end

