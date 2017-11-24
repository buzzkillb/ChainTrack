module WalletsHelper
  def get_badge_color wallet
    days_since_updated = (Time.current.to_date - wallet.last_changed.to_date).to_i
    case days_since_updated
      when 0..1
        'success'
      when 2..4
        'warning'
      else
        'danger'
    end
  end
end
