class SmsSender
  def initialize(recipient, text, login, password)
    @recipient = recipient
    @text = text
    @login = login
    @password = password
  end
  
  def send_sms
    uri = URI.parse('http://svitsms.com/api/api.php')
    phone = @recipient
    text = @text

    header = {
      'Content-Type': 'text/xml'      
    }
    xml = <<~XML
    <?xml version="1.0" encoding="utf-8"?>
    <request>
      <operation>SENDSMS</operation>
      <message start_time="AUTO" end_time="AUTO" lifetime="4" rate="120" desc="My first campaign " source="SMS">
        <body>#{text}</body> 
        <recipient>#{phone}</recipient>
      </message>
    </request>
    XML
    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE  
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = xml
    request.basic_auth @login, @password

    #request.use_ssl = false

    # Send the request
    response = http.request(request)


    puts response.code
    puts response.body

  end
end