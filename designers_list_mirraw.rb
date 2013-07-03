require 'open-uri'
require 'nokogiri'
url = 'http://www.mirraw.com/designers'
tag = 'div'
property = 'class="designer_pane clearfix"'
nameTag = "div[class='designer_about'] a"
designsTag = "li[class='span-2'] strong"
pullTags = Array[nameTag, designsTag]
def getPage(url)
	page = Nokogiri::HTML(open(url))
	return page
end
def extractContent(tag,property,page)
	mix = tag+'['+property + ']'
	content = page.css(mix)
	return content
end
def printDesignerInfo(content,pullTags)
	content.each do |value|
		designerInfo = (value.css(pullTags[0]).first).text
		designerFoll = (value.css(pullTags[1])).text
		print designerInfo +":"+ designerFoll+"\r\n"
	end
end
page = getPage(url)
content = extractContent(tag,property,page)
info = printDesignerInfo(content,pullTags)
