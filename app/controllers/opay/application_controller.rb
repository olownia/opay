module Opay
  class ApplicationController < ActionController::Base
    def correct_authorization
      payment = Opay::Payment.where(session_id: params[:session_id]).first!
      payment.payable.finish
      redirect_to main_app.send(Opay.config.success_url)
    end

    def wrong_authorizationt
      redirect_to main_app.send(Opay.config.cancel_url)
    end
  end
end
