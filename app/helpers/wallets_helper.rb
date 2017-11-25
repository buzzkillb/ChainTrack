module WalletsHelper
  def get_badge_details wallet
    days_since_updated = (Time.current.to_date - wallet.last_changed.to_date).to_i
    case days_since_updated
      when 0..1
        { icon: 'success', text: 'Fresh' }
      when 2..4
        { icon: 'warning', text: 'Aging' }
      else
        { icon: 'danger', text: 'Old' }
    end
  end
end
