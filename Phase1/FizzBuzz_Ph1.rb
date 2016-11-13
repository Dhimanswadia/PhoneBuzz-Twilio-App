require 'rubygems'
require 'twilio-ruby'
require 'sinatra'


get '/' do

	@auth_token = 'a9ac987e539162e280ca358ca8ee28c4' #validation of  Twilio call
	validator = Twilio::Util::RequestValidator.new(@auth_token)
	uri = request.url
	params = env['rack.request.query_hash']
	signature = env['HTTP_X_TWILIO_SIGNATURE']
	verified = validator.validate uri, params, signature

	unless verified
	  response = Twilio::TwiML::Response.new do |r|
	    r.Say 'Unvalidated request'
	    r.Hangup
	  end
	  response.text
	end

  	Twilio::TwiML::Response.new do |r|
    	r.Gather :action => '/playFizzBuzz', :method => 'get' do |g|
    		g.Say 'Please choose a number then press the pound sign'
    	end
  	end.text
end

get '/playFizzBuzz' do
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
