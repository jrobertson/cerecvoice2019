#!/usr/bin/env ruby

# file: cerecvoice2019.rb

require 'digest/md5'
require 'rxfhelper'


# English voices
# --------------
#
# England: Claire (Lancashire), Giles, Jack, Jess, Lauren, Sarah, 
#          Sue (Black Country), William
# Ireland: Caitlin
# Scotland: Dodo, Heather, Kirsty, Stuart
#

class Cerecvoice2019Error < Exception
end

class Cerecvoice2019
  include RXFHelperModule
  using ColouredText
 
  def initialize(accountid: nil, password: nil, voice: 'Heather', config: {}, 
                 cache_filepath: 'cache', 
                 url: 'https://cerevoice.com/rest/rest_1_1.php', debug: false)

    @config = ({
      'method' => 'speakExtended',                
      'accountID' => accountid,
      'password' => password,                
      'voice' => voice,
      'audioFormat' => 'ogg',
      'sampleRate' => '48000',
      'metadata' => 'True',
      'audio3D' => 'True'
    }).merge config
    
    @url, @cache_filepath, @debug = url, cache_filepath, debug

    if @config['accountID'].nil? or @config['password'].nil? then
      raise Cerecvoice2019Error, 'invalid accountID or password' 
    end    
    
  end

  def tts(text='', voice=@config['voice'], out: 'output.' + @config['audioFormat'])

    
    audiofile_out =- out
    
    raise Cerecvoice2019Error, 'text empty' if text.empty?
    
    FileUtils.mkdir_p @cache_filepath
    
    h = Digest::MD5.new << text + voice
    filename = File.join(@cache_filepath, h.to_s + '.'+ @config['audioFormat'])
    
    
    # attempts to find the audio file from a local cache instead of 
    # making a relatively expensive request through the web API
    
    if not File.exists? filename then
            
      @config.merge!('text' => CGI.escape(text), 'voice' => voice)
      url = @url + '?' + @config.map {|x| x.join('=')}.join('&')
      puts ('url: ' + url.inspect).debug if @debug
      xml = open(url).read
      puts ('xml: ' + xml.inspect).debug if @debug
      
      doc = Rexle.new xml
      audio_url = doc.root.text('fileUrl')
      puts ('audio_url: ' + audio_url.inspect).debug if @debug
      
      
      puts ('writing file: ' + filename.inspect).debug if @debug
      
      File.open(filename, "wb") do |saved_file|
        # the following "open" is provided by open-uri
        open(audio_url) {|read_file| saved_file.write(read_file.read) }
      end      

    end    
    
    FileUtils.cp filename, audiofile_out    

  end

end

