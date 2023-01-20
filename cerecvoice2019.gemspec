Gem::Specification.new do |s|
  s.name = 'cerecvoice2019'
  s.version = '1.0.2'
  s.summary = 'Unofficial Cerevoice gem using their text-to-speech API. #tts'
  s.authors = ['James Robertson']
  s.files = Dir['lib/cerecvoice2019.rb']
  s.add_runtime_dependency('rxfhelper', '~> 1.6', '>=1.6.4')
  s.signing_key = '../privatekeys/cerecvoice2019.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/cerecvoice2019'
end
