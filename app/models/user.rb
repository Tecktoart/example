class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable
  has_many :articles, dependent: :destroy
  has_many :likes, -> { likes }, class_name: 'Vote'
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def self.find_for_facebook_oauth auth

    if user = User.where(:url => auth.info.urls.Facebook).first
      user
    else
      User.create!(:provider => auth.provider,
                   :url => auth.info.urls.Facebook,
                   :username => auth.extra.raw_info.name,
                   :email => auth.extra.raw_info.email,
                   :avatar => auth.info.image,
                   :password => Devise.friendly_token[0,20])
    end
  end

  def self.find_for_vkontakte_oauth auth
    if user = User.where(:url => auth.info.urls.Vkontakte).first
      user
    else
      User.create!(:provider => auth.provider,
                   :url => auth.info.urls.Vkontakte,
                   :username => auth.info.name,
                   :email => auth.info.email,
                   :avatar => auth.extra.raw_info.photo_100,
                   :password => Devise.friendly_token[0,20])


    end
  end


end
