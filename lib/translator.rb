require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons=YAML.load_file(file_path)
  
  actions={"get_meaning"=>{},"get_emoticon"=>{}}

  emoticons.each do |meaning, emote_array|
    actions["get_meaning"][emote_array[1]]=meaning
    actions["get_emoticon"][emote_array[0]]=emote_array[1]
  end
  actions
end

def get_japanese_emoticon(file_path,emoticon)
  actions=load_library(file_path)
  def_found=false
  actions.each do |library,content|
    content.each do |words, definitions|
      if words==emoticon
        return definitions
        def_found=true
      end
    end
  end
  if def_found==false
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path,emoticon)
  actions=load_library(file_path)
  def_found=false
  actions.each do |library,content|
    content.each do |words, definitions|
      if words==emoticon
        return definitions
        def_found=true
      end
    end
  end
  if def_found==false
    return "Sorry, that emoticon was not found"
  end
end