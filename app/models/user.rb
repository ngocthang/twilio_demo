class User < ActiveRecord::Base
  SID = 'AC9071d810586f2496d0587b05caf4d8f3'
  TOKEN = '4e22135b14820da84f8d80e4f67553fc'

  def generate_pin
    self.pin = rand(0000..9999).to_s.rjust(4, "0")
    save
  end

  def send_pin
    twilio_client = Twilio::REST::Client.new User::SID, User::TOKEN
    twilio_client.messages.create(
      to: phone_number,
      from: '+12017784315',
      body: "Your PIN is #{pin}"
    )
  end

  def verify pin
    update(verified: true) if self.pin == pin
  end
end
