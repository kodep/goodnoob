
function send_track_signup(){

	ga('send', 'event', 'signup', 'click' );
}

function send_track_btnRegister_signup(){

	ga('send', 'event', 'signup_end', 'click' );
}

function send_track_upload(){

	ga('send', 'event', 'upload', 'click' );
}

function send_track_buy(){

	ga('send', 'event', 'visitor_buy', 'click' );
}

$('.add-review').click(function() {
            send_track_review();
          });

function send_track_review(){

	ga('send', 'event', 'visitor_review', 'click' );
}
