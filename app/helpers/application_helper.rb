module ApplicationHelper

  def render_create_time(o)
    render_date_time(o.created_at.localtime)
  end

  def render_update_time(o)
    render_date_time(o.created_at.localtime)
  end

  def render_date_time(time)
    time.strftime('%H:%M:%S %m/%d %Y' )
  end

  def render_text(text, length: length)
    if length.nil?
      text
    else
      text[0,length] + '...'
    end
  end

  def render_price(price)
    sprintf("%2.2f", price)
  end

  def render_order_status(order)
    case order.aasm_state
    when 'placed'
      "待支付"
    when 'paid'
      "已支付"
    when 'shipping'
      "已出货"
    when 'shipped'
      "已送达"
    when 'cancelled'
      "已取消"
    when 'returend'
      "已退货"
    end
  end
end
