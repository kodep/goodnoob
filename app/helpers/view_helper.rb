module ViewHelper

  def modal_link(text = 'Modal link', add_class = nil)
    content_tag(:a, text, class: add_class, data: { toggle: 'modal', target: '#SignInModal'})
  end

  # <div class='embed-responsive embed-responsive-16by9'>
  # <iframe class='embed-responsive-item' src='<%= video.url %>' allowfullscreen></iframe>
  #   <i class="dell glyphicon glyphicon-share"></i>
  # <div class='zalupa'>
  # <i class="glyphicon glyphicon-remove"></i>
  #     <div class='zalupa-text'>
  #       <p> Share </p>
  # <a href="<%= request.original_url %>"> <%= request.original_url %> </a>
  #     </div>
  #   </div>
  # </div>

  def video_with_share(video_url)
    content_tag(:div, class: 'embed-responsive embed-responsive-16by9') do
      content_tag(:iframe, '', class: 'embed-responsive-item', src: video_url) +
      content_tag(:i, '', class: 'close-share-video glyphicon glyphicon-share')+
      content_tag(:div, class: 'share-video') do
        content_tag(:i, '', class: 'reclose-share-video glyphicon glyphicon-remove') +
        content_tag(:div, class: 'share-video-text') do
          content_tag(:p, 'Share') +
          link_to(request.original_url, request.original_url)
        end
      end
    end
  end

end
