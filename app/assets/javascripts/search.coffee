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
