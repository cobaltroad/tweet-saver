require 'net/http'

class Tweet

  def self.search(q)
    corrected_q = q.gsub(/ /,'%20')

    url_string = "http://search.twitter.com/search.json?q=#{corrected_q}"

    uri = URI.parse(url_string)

    begin
      response = Net::HTTP.get_response(uri)
      output = JSON.parse(response.body)
    rescue Errno::ETIMEDOUT => e
      output = {errors: [e.inspect]}
    rescue URI::InvalidURIError => e
      output = {errors: [e.inspect]}
    end
    output
  end

end