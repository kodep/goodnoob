$(document).ready ->
  $('body').on 'click', '#welcome_login_button', ->
    $('#welcome_login_form, #welcome_login_image').addClass('hidden')
    $('#welcome_register_form, #welcome_register_image').removeClass('hidden')
  $('body').on 'click', '#welcome_register_button', ->
    $('#welcome_login_form, #welcome_login_image').removeClass('hidden')
    $('#welcome_register_form, #welcome_register_image').addClass('hidden')
  if $('#welcome_page').length > 0
    $('#navbar_render, #footer_render, #render_modal_bootstrap').addClass('hidden')
  $('body').on 'click', '#btnLogin', ->
    $('#SignInModal').modal({show: true})
  $('body').on 'click', '#btnRegister', ->
    $('#SignUpModal').modal({show: true})
