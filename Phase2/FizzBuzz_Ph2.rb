require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
require 'slim'


get "/" do
	slim :index
end

get '/number' do
	auth_token = 'a9ac987e539162e280ca358ca8ee28c4'
	account_id = 'AC7ef959d3c231225b1fd0e3ed61b7103b'

	@client = Twilio::REST::Client.new account_id, auth_token
	Numb = params[:number] || "+17656378556"

	if Numb !~ /^\d{10}$/
		Twilio::TwiML::Response.new do |r|
			r.Say "Invalid input"
		end.text
	else
		@call = @client.account.calls.create(
			:from => '+13178545610',   # Twilio number
			:to => Numb,
			:url => 'https://handler.twilio.com/twiml/EH03ebb263097f8e5c1c908774de3e01af'
		)
	end
end

get '/playfizzbuzz' do
	n = params['Digits'].to_i

	if n <= 0
		Twilio::TwiML::Response.new do |r|
			r.Say "Invalid input"
		end.text
	else
		answer = ''
		(1..n).each do |i|
			if i % 5 == 0 and i % 3 == 0
	        answer << "FizzBuzz, "
	      elsif i % 5 == 0
	        answer << "Buzz, "
	      elsif i % 3 == 0
	        answer << "Fizz, "
	      else
	        answer << i.to_s + ", "
	      end
		end

		Twilio::TwiML::Response.new do |r|
			r.Say answer
		end.text
	end
end
