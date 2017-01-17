$(document).on 'turbolinks:load', ->
  new SearchForm $(elem) for elem in $('.search-form--inline')

class SearchForm
  constructor: (@el)->
    @input = @el.find('.search-field')
    @suggestions = @el.find('.suggestions')
    @products = @el.find('.s-products')
    @categories = @el.find('.s-categories')
    @input.on 'keyup', @onKeyUp
    @input.on 'blur', @onBlur

  onKeyUp: =>
    query = @input.val()
    if !query or query.length < 3
      @suggestions.slideUp()
    else
      clearTimeout(@searchDelay);
      @searchDelay = setTimeout(@searchProduct, 200)

  onBlur: =>
    slideUp = => @suggestions.slideUp()
    setTimeout(slideUp, 200)

  searchProduct: =>
    query = @input.val()
    $.ajax '/search/suggestions' ,
      type: "GET",
      dataType: "JSON",
      data:
        search: query
      success: (products) =>
        @render(query, products)
        @suggestions.slideDown()

  render: (query, products) =>
    @renderCategories(query, products)
    @renderProducts(query, products)

  renderProducts: (query, products) =>
    result = ''
    for product in products
      result += @productTemplate(query, product)
    @products.html(result)

  renderCategories: (query, products) =>
    result = @socialFeedTemplate(query)
    for product in products
      result += @categoryTemplate(query, product)
    @categories.html(result)

  productTemplate: (query, product) ->
    "<a href='/products/#{product.id}' class='s-suggestion'>#{@productTitle(product, query)}</a>"

  categoryTemplate: (query, product) ->
    search_params = $.param { search: product.name }
    "<a class='s-suggestion' href='/sub_categories/#{product.sub_category.id}?#{search_params}'>" +
    "  #{@productTitle(product, query)} in " +
    "  <span class='s-highlight-primary'>#{product.sub_category.name}</span>" +
    "</a>"

  socialFeedTemplate: (query) ->
    search_params = $.param { search: query }
    "<a class='s-suggestion' href='/search?#{search_params}'>" +
    "  <span class='s-query'>#{query}</span> in " +
    "  <span class='s-highlight-primary'>Social Feed</span>" +
    "</a>"


  highlight: (text, word) ->
    rgxp = new RegExp(word, 'gi')
    repl = '<span class="s-query">$&</span>'
    text.replace(rgxp, repl)

  productTitle: (product, query) ->
    value = product.name
    value += " (#{product.year})" if product.year
    value = @highlight(value, query) if query
    value
