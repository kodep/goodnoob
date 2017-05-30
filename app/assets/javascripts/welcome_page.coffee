$(document).ready ->
  $('body').on 'click', '#welcome_login_button', ->
    $('#welcome_login_form').css('display', 'none')
    $('#welcome_login_image').css('display', 'none')
    $('#welcome_register_form').css('display', 'block')
    $('#welcome_register_image').css('display', 'block')
  $('body').on 'click', '#welcome_register_button', ->
    $('#welcome_login_form').css('display', 'block')
    $('#welcome_login_image').css('display', 'block')
    $('#welcome_register_form').css('display', 'none')
    $('#welcome_register_image').css('display', 'none')
  if $('#welcome_page').length > 0
    $('#navbar_render').css('display', 'none')
    $('#footer_render').css('display', 'none')
    $('#render_modal_bootstrap').css('display', 'none')

