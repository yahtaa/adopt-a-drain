desc "This task is called by the Heroku scheduler add-on to send out generic monthly reminders"
task :send_monthly_generic => :environment do
  ThingMailer.send_generic.deliver
end

desc "This task is called by the Heroku scheduler add-on to send out personalized monthly reminders"
task :send_monthly_personalized => :environment do
  ThingMailer.send_personalized
end


desc "This task is called by the Heroku scheduler add-on to send out personalized monthly reminders"
task :send_reminder => :environment do
	 
	Users.each do | u |
		 
		account_code = ENV['account_code']
		destination = u.email
		topics = "topics"
		username = ENV['username']
		password = ENV['password']
		 		 
		 # // split the list of topics
		topic_list = topics.split(',')
		 
		url = "https://stage-api.govdelivery.com/api/account/$account_code/subscribers/add_subscriptions"
		 
		begin
		    request_body = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "  <subscriber>"
		     
		    if destination.match ("@").length > 0
				request_body = request_body + "   <email>#{destination}</email>"
		    else
				request_body = request_body + "   <phone>#{destination}</phone>"
				request_body = request_body + "   <country-code>1</country-code>"
		  	end

			request_body = request_body + "   <send-notifications type='boolean'>false</send-notifications>"
			request_body = request_body + "   <topics type='array'>"
		 
			topic_list.each do | topics | 
				request_body = request_body + "    <topic>"
				request_body = request_body + "     <code>#{topic}</code>"
				request_body = request_body + "    </topic>"
			end

		    request_body = request_body + "  </topics>"
		    request_body = request_body + "  </subscriber>"
		     
		    # $request
		    #   -> setHeader('Content-type: text/xml; charset=utf-8')
		    #   -> setBody($request_body);
		     
		    # print "Connecting with ";
		    # print_r($request);
		    # print "\n";
		       
		    # $response = $request -> send();
		 
		    # echo "Response status: " . $response -> getStatus() . "\n";
		    # echo "Human-readable reason phrase: " . $response -> getReasonPhrase() . "\n";
		    # echo "Response HTTP version: " . $response -> getVersion() . "\n";
		    # echo "Response object:\n";
		    # print_r($response) . "\n";
		      
		    # if($response->getHeader('content-encoding') == 'gzip')
		    #   {
		    #     echo "Gzipped!\n";
		    #     $response_body = $response -> decodeGzip($response->getBody());
		    #   }
		    # else
		    #   {
		    #     $response_body = $response -> getBody();
		    #   }
		 
		    # echo "Response payload\n";
		    # echo $response_body;
		     
		    # if($response -> getStatus() != 200)
		    # {
		    #   // log an error
		    #   print "Got a non-successful return code, please inspect the response body\n";
		    # }
		 
	 	rescue 
		  puts "ERROR" 
		end
	end
end