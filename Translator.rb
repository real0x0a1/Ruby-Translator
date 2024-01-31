# -*- Author: Ali -*-
# -*- Info: Ruby script for translating text using Google Translate API -*-

require 'net/http'
require 'json'

def translate_text(text, source_lang, target_lang)
  url = URI("https://translate.googleapis.com/translate_a/single?client=gtx&sl=#{source_lang}&tl=#{target_lang}&dt=t&q=#{URI.encode(text)}")
  response = Net::HTTP.get(url)
  translation = JSON.parse(response)[0][0][0]
  
  return translation
end

source_text = "Hello, how are you?"
source_lang = "en"
target_lang = "es"

translated_text = translate_text(source_text, source_lang, target_lang)
puts "Translated Text: #{translated_text}"