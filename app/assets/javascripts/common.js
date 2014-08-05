function blogIndexClick(category, label) {
	pushEvent(category, 'Click', label);
}

function pushEvent(category, action, label) {
	alert(category);
	_gaq.push(['_trackEvent', category, action, label]);
}

function userLogin() {
	pushEvent('Login', 'Submit', 'Returning User');
}

function userSignup() {
	pushEvent('Sign up', 'Submit', 'New User');
}
