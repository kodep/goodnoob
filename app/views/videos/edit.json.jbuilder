json.title 'edit a video'
json.body render partial: 'videos/edit', formats: %i(html), locals: {video: @video}
json.footer yield :action
