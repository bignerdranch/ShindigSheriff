module CalculateTotalHelper

  def estimated_total(items)
    items.sum(:estimated_amount)
  end

  def verified_total(items)
    items.where(status: true).sum(:estimated_amount)
  end

end

