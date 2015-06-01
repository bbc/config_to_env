# config_to_env

Take a json configuration file, and load it into the running 
process environment variables before anything
in your program runs.

## Why would you want to use this?

We have a number of applications that use environment variable
configuration overrides, but our deployment system uses json 
file configs. It's useful for us to simply surface the 
configuration as environment variables as our app loads.

## How to use

The api is extremely simple, and mainly works at require time.

You just need to set a couple of constants to enable the config:

    JSON_CONFIG = '/path/to/your/file.json'
    require 'config_to_env'

This will load the contents of your json file into the environment
of the currently running process. A file like this:

    {
        "environment": "test",
        "configuration": {
            "aa": "one",
            "bb": "two"
        },
        "secondary_configuration": {
            "cc": "three"
        }
    }

Will be loaded into the environment as the following:

    ENVIRONMENT: 'test'
    CONFIGURATION_AA: 'one'
    CONFIGURATION_BB: 'two'
    SECONDARY_CONFIGURATION_CC: 'three'

You can optionally specify particular nodes of the json that
you want to include:

    JSON_CONFIG_NODES = ['environment', 'configuration']
    
Which would give you:

    ENVIRONMENT: 'test'
    AA: 'one'
    BB: 'two'

The secondary configuration is dropped entirely.

## License

config_to_env is available to everyone under the terms of the 
MIT open source licence. Take a look at the LICENSE file in the 
code.

Copyright (c) 2015 BBC

  
