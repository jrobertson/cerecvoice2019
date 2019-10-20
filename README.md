# Using the Cerecvoice2019 gem


## Usage

    require 'cerecvoice2019'

    # voices:

    # Scotland: Dodo, Heather, Kirsty, Stuart
    # England: Claire (Lancashire), Giles, Jack, Jess, Lauren, Sarah, 
    #          Sue (Black Country), William
    # Ireland: Caitlin

    c = Cerecvoice2019.new accountid: 'accountid', password: 'password'
    c.tts "Hello, what are you doing today?", 'Caitlin', out: '/tmp/out.ogg'
    `ogg123 /tmp/out.ogg`


## Resources

* cerecvoice2019 https://rubygems.org/gems/cerecvoice2019
* CereVoice Cloud Text-to-Speech Web Service https://www.cereproc.com/en/products/cloud

voice tts cerecvoice cerecvoice2019 gem speech
