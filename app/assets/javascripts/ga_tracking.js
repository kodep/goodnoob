

function handleOutboundLinkClicks(event) {
  ga('send', 'event', {
    eventCategory: 'Outbound Link',
    eventAction: 'click',
    eventLabel: event.target.href
  });
}


function send_track_signup_complete() {
	ga('send', 'clicksignupcomplete');
}

function send_track_signup() {
	ga('send', 'clicksignup');
}

function send_track_signup() {
	ga('send', 'clicksignup');
}

function send_track_signup() {
	ga('send', 'clicksignup');
}
