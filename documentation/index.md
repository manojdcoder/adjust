# Adjust 

## Description

https://www.adjust.com/attribution/ for iOS

## Accessing the adjust Module

To access this module from JavaScript, you would do the following:

    	var Adjust = require("ti.adjust");

## Methods

### init

	Adjust.init({
		key : "API_KEY",
		environment : Adjust.ENVIRONMENT_SANDBOX,
		logLevel : Adjust.LOG_LEVEL_VERBOSE
	}); 

## CONSTANTS

	ENVIRONMENT_SANDBOX
	ENVIRONMENT_PRODUCTION
	LOG_LEVEL_VERBOSE
	LOG_LEVEL_DEBUG
	LOG_LEVEL_INFO
	LOG_LEVEL_WARN
	LOG_LEVEL_ERROR
	LOG_LEVEL_ASSERT

## License

MIT