class StaticsController < ApplicationController


  def about_us
    
  end

  def promotions
    
  end

  def events
    
  end

  def magazine
    uri = URI('http://search.issuu.com/api/2_0/document')
    uri.query = URI.encode_www_form({:username => "ocutecmagazine", :responseParams => "*", :sortBy => "epoch desc"})
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      resp_json = JSON.parse(res.body) 
      mags = Array.new
      resp_json["response"]["docs"].each do |x|
        mags << [x["description"], x["docname"]]
      end
      @documents = issuu_get(mags)
    end
  end

  def contact_us
    
  end

  private
  def issuu_get codes
    codes.each do |code|
      uri = URI.parse("http://issuu.com/ocutecmagazine/docs/#{code[1]}?mode=a_p&wmode=0")
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
        code << response.header['location'].split("=").last
      end
    end
  end

end
