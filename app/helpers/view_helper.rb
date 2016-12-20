module ViewHelper

  # <a type="button" class="product-button product-add-favourites hidden-xs" data-toggle='modal' data-target='#SignInModal'>Add to Favourites</a>

  def modal_link(text = 'Modal link', add_class = nil)
    content_tag(:a, text, class: add_class, data: { toggle: 'modal', target: '#SignInModal'})
  end

end
