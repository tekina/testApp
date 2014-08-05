function pushEvent(category, action, label) {
	_gaq.push(['_trackEvent', category, action, label]);
}

function blogIndexClick(category, label) {
	pushEvent(category, 'Click', label);
}

function userLogin() {
	pushEvent('Login', 'Submit', 'Returning User');
}

function userSignup() {
	pushEvent('Sign up', 'Submit', 'New User');
}
