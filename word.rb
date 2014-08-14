require 'nokogiri'
require 'open-uri'
require 'uri'
require 'csv'
require 'timeout'
require 'socket'

API = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/{word}?key={key}"

def meaning(word)
	word = word.sub(' ','_')
	retry_count = 0
  begin
    api_word = API.sub('{word}', word)
    Timeout::timeout(4) do
      xml_doc  = Nokogiri::XML(open(api_word))
  		if (suggestion = xml_doc.css('suggestion').first) != nil
  			word = suggestion.text
  			return word_with_meaning = meaning(word)
  		elsif (def_tag = xml_doc.css('def').first) != nil
        meaning = def_tag.css('dt').text
  			return {:word => word, :meaning => meaning}
      else
        return {:word => word, :meaning => ''}
  		end
    end
  rescue Timeout::Error
    sleep 1
    retry_count += 1
    if retry_count < 2
      retry
    else
      return {:word => word, :meaning => ''}
    end
  rescue URI::InvalidURIError, SocketError
		return {:word => word, :meaning => ''}
	end
end

list = []

CSV.open("word_list_meanings.csv", "wb") do |csv_array|
  csv_array << ["word", "meaning"]
  list.each_with_index do |word, index|
    puts (list.length - index).to_s + ' words left' if index % 20 == 0 
    csv_array << meaning(word).values
  end
end
