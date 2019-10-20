Gem::Specification.new do |s|
  s.name = 'cerecvoice2019'
  s.version = '0.9.0'
  s.summary = 'Unofficial Cerecvoice gem using their text-to-speech API. #tts'
  s.authors = ['James Robertson']
  s.files = Dir['lib/cerecvoice2019.rb']
  s.add_runtime_dependency('rxfhelper', '~> 0.9', '>=0.9.4')
  s.signing_key = '../privatekeys/cerecvoice2019.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/cerecvoice2019'
end
