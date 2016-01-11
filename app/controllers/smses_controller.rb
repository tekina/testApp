class SmsesController < ApplicationController
  require 'twilio-ruby'
  
  def sms_quickstart
    greetings = ['How\'s it going?', 'What\'s up?', 'Good to hear from you!', 'Sup?', 'Howdy!', 'Well hello!', 'Look what the cat dragged in!']
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "#{greetings.sample} Thanks for the message!"
    end
    render xml: twiml.text
  end
  
end
