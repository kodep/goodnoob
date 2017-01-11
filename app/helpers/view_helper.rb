module ViewHelper

  def modal_link(text = 'Modal link', add_class = nil)
    content_tag(:a, text, class: add_class, data: { toggle: 'modal', target: '#SignInModal'})
  end

  def guide_video_with_share(guide)
    video_url = VideoInfo.new(guide.video_url).embed_url
    content_tag(:div, class: 'embed-responsive embed-responsive-16by9') do
      content_tag(:iframe, '', class: 'embed-responsive-item', src: video_url)
    end
  end

  def video_with_share(video)
    content_tag(:div, class: 'embed-responsive embed-responsive-16by9') do
      content_tag(:iframe, '', class: 'embed-responsive-item', allowfullscreen: 'allowfullscreen', src: video.url)
    end
  end
end
