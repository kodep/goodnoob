module ViewHelper

  def modal_link(text = 'Modal link', add_class = nil)
    content_tag(:a, text, class: add_class, data: { toggle: 'modal', target: '#SignInModal'})
  end

  def video_with_share(video)
    content_tag(:div, class: 'custom-share-video embed-responsive embed-responsive-16by9') do
      content_tag(:iframe, '', class: 'embed-responsive-item', src: video.url) +
      content_tag(:i, '', class: 'close-share-video glyphicon glyphicon-share')+
      content_tag(:div, class: 'share-video') do
        content_tag(:i, '', class: 'reclose-share-video glyphicon glyphicon-remove') +
        content_tag(:div, class: 'share-video-text') do
          content_tag(:p, 'Share') +
          link_to(video_url(video), request.original_url)
        end
      end
    end
  end

end
