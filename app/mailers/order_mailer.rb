class OrderMailer < ApplicationMailer
	def notify_order_placed(order)
		@order = order
		@user = @order.user
		@order_items = @order.items
		@order_info = @order.info

		mail(to: @user.email, subject: "[YS Backer] 感謝您完成本次下單，以下是您此次的購物明細 #{order.token}")
	end

	def send_simple_message
	  RestClient.post "https://api:key-66741ea033f2b754f72b41a5f7ec475c"\
	  "@api.mailgun.net/v3/sandboxd3a2a8bec6e741acb9ef0adea6e3b530.mailgun.org/messages",
	  :from => "Mailgun Sandbox <postmaster@sandboxd3a2a8bec6e741acb9ef0adea6e3b530.mailgun.org>",
	  :to => "fisher <fisherliang.tw@gmail.com>",
	  :subject => "Hello fisher",
	  :text => "Congratulations fisher, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
	end
end
