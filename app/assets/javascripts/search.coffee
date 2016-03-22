$ ->
  $(document).on 'click', '.remove-from-favorites', (event) ->
    event.preventDefault()
    $this = $(@)
    url = $this.attr 'href'
    $.ajax
      method: "GET",
      url: url,
      success: ->
        $this.closest('.filter-wrapper').slideUp()

  $(document).on 'click', '.remove-search', (event) ->
    event.preventDefault()
    $this = $(@)
    url = $this.attr 'href'
    $.ajax
      method: "GET",
      url: url,
      success: ->
        $this.closest('.filter-wrapper').slideUp()

  $(document).on 'click', '.applied-sub-filter', (event) ->
    event.preventDefault()
    $this = $(@)
    id = $this.data('id')
    switch $this.data( 'type')
      when 'filter' then $("#checkbox_#{id}").attr('checked', null).change()
      when 'company' then $("#checkbox_com_#{id}").attr('checked', null).change()
      when 'year_from' then $('#year_from').val($("#year_from option:first").val()).change()
      when 'year_to' then $('#year_to').val($("#year_from option:first").val()).change()
      when 'price_from' then reset_price_from()
      when 'price_to' then reset_price_to()

reset_price_from = ->
  $slider = $('#slider')
  prices = $slider.slider('option', 'values')
  $slider.slider('values', 0, $slider.slider('option', 'min'))
  $slider.slider('option', 'slide').call()
  $('#filter_form').submit()

reset_price_to = ->
  $slider = $('#slider')
  prices = $slider.slider('option', 'values')
  $slider.slider('values', 1, $slider.slider('option', 'max'))
  $slider.slider('option', 'slide').call()
  $('#filter_form').submit()
