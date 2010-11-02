class Notifier < ActionMailer::Base
  default :from => "staff@kaisen_oonuma.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.ordered.subject
  #
  def ordered(order)
    @greeting = "Hi"
    @order = order

    mail :to => @order.email, :bcc => "kaisen-admin@example.com"
  end
end
