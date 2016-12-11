#PhoneBuzz
It is a game to play fizzbuzz over the Phone.
(Time Spent 4 hours)

1) I have implemented the first three phases of the app;
a)Phase 1 is a fizzbuzz app in which the user calls a twilio number and the user can play the fizzbuzz game on that
number; Use Case Example the user inputs 3, the output will be 1,2,Fizz.

b)Phase 2 is a continuation of Phase 1 where the user can go to a webpage and put in the number.The user will then recieve a call from the twilio number to play the game.Then the functionality is same as task

c)Phase 3 is a continuation of Phase 2 where the user can add delay to the number. Other functionality is same.

Instructions to Run the app.
1) - Set Up twilio account - I used ngrok to create a link for my localhost which is accessible by twilio.
Once you have ngrok create url for localhost:4567 and then paste the ngrok link on  twilio account voice settings.


(1b) Please  run bundle install if some gem is missing in any  phase. Thanks!

2) - In Phase 1 in FizzBuzz_Ph1 change auth_token variable to your twilio credentials. Then run "ruby FizzBuzz_Ph1.rb".
Call your twilio account number and enter a number and end it with a #  and then  enjoy the output.

3) -In Phase 2  in FizzBuzz_Ph2 change auth_token variable to your twilio credentials.
		a) Go to Phonebuzz.xml and change the <Gather action="http://574e1cb4.ngrok.io/playfizzbuzz" method="get">
		 with your ngrok link +/playfizzbuzz.
		b) The TwiML file is hosted on twilio Twiml paste bin. Please copy the code of your edited  PhoneBuzz.xml to twilio Twiml Bin
				creator and change the "url" in FizzBuzz_Ph2 with your twilio Twiml link.Shown Below;
				@call = @client.account.calls.create(
					:from => '+13178545610',   # Your  Twilio number
					:to => Numb,
					:url => 'https://handler.twilio.com/twiml/EH03ebb263097f8e5c1c908774de3e01af'  //change the link;
				)
				NOTE - Using any other provider to host the twiml can cause errors in the twilio system due to various auth errors.
						i request you to use the twilio twiml bin.

		c) After Setting that up run "ruby FizzBuzz_Ph2.rb". Then  navigate to your  ngrok link in your browser,
		and then on the webpage enter a phone number with this format: XXXXXXXXXX  like 7656378557, then press call.
		NOTE - The browser might go blank  or show some random error message but please wait for the time you put in
		the delay and you will get the call for sure.
		Twilio will call your number and ask you to input a number.enter a number and end it with a #  and then  enjoy the output.

4)-In Phase 3 follow the exact same stops as phase 2(just changing the url should be enough). run "ruby FizzBuzz_Ph3.rb" Navigate to ngrok
link  and enter the number. You will be able to add delay in minutes.Other functionality is same.


Note- Please contact me for further questions about running the program if necessary.
Thanks.
