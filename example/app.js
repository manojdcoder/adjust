var Adjust = require("ti.adjust");
Adjust.init({
	key : "API_KEY",
	environment : Adjust.ENVIRONMENT_SANDBOX,
	logLevel : Adjust.LOG_LEVEL_VERBOSE
});
Adjust.trackEvent("EVENT_TOKEN");
Adjust.trackEvent("EVENT_TOKEN", {
	name : "A event"
});
