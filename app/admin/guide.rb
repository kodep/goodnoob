ActiveAdmin.register Guide do

  belongs_to :sub_category, optional: true

  permit_params :header, :description, :sub_category_id, :video_url, :image

  filter :header
  filter :sub_category
  filter :created_at

  index do
    id_column
    column :header
    column(:description) { |g| truncate(g.description, length: 60) }
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :sub_category
      f.input :header
      f.input :description, as: :html_editor
      f.input :image, as: :file
    end
    f.actions
  end

end
