class SmsesController < ApplicationController
  require 'twilio-ruby'
  
  def sms_quickstart
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Hey Monkey. Thanks for the message!"
    end
    render xml: twiml.text
  end
  
end
