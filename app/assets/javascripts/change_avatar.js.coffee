$(document).ready ->
  $('#newPictureForAvatar').on 'change', (event) ->
    image = event.target.files[0]
    reader = new FileReader
    reader.onload = (file) ->
      $('#pictureAvatar img').each  ->
        $( this )[0].src = file.target.result
    reader.readAsDataURL image
