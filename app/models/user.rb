class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :currency
  belongs_to :language
  has_one :address, as: :addressable, dependent: :destroy
  has_many :ratings

  has_many :favourites, foreign_key: 'user_id', class_name: 'UserFavourite', dependent: :destroy

  has_many :user_favourite_categories, -> { UserFavourite.categories }, class_name: 'UserFavourite'
  has_many :favourite_categories, through: :user_favourite_categories, source: :favouriteable, source_type: 'Category'

  has_many :user_favourite_companies, -> { UserFavourite.companies }, class_name: 'UserFavourite'
  has_many :favourite_companies, through: :user_favourite_companies, source: :favouriteable, source_type: 'Company'

  has_many :user_favourite_photos, -> { UserFavourite.photos }, class_name: 'UserFavourite'
  has_many :favourite_photos, through: :user_favourite_photos, source: :favouriteable, source_type: 'Photo'

  has_many :user_favourite_products, -> { UserFavourite.products }, class_name: 'UserFavourite'
  has_many :favourite_products, through: :user_favourite_products, source: :favouriteable, source_type: 'Product'

  has_many :user_favourite_videos, -> { UserFavourite.videos }, class_name: 'UserFavourite'
  has_many :favourite_videos, through: :user_favourite_videos, source: :favouriteable, source_type: 'Video'

  has_many :videos
  has_many :photos

  has_many :reviews
  has_many :searches
  has_one :picture, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :picture, reject_if: proc { |attributes| attributes['image'].blank? }

  def save_search( search_string )
    if ( searches.last.nil? or searches.last.text != search_string ) and !search_string.blank?
      searches.build( text: search_string )
      save
    end
  end

  def remove_search( id )
    s = searches.find_by_id(id)
    searches.delete( s ) if s
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role                   :integer
#  currency_id            :integer
#  language_id            :integer
#  last_name              :string
#  dob                    :date
#  sex                    :integer
#  company                :boolean
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
