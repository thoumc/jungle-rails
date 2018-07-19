class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    @order = order

    mail(to: "thoumc@hotmail.com", subject: "Order: #{order.id}" )
  end

end
