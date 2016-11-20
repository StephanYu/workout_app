class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exercises
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
  has_one :room
  has_many :messages

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :create_chatroom

  self.per_page = 10
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search_by_name(name)
    names = name.split(" ")

    if names.size > 1
      where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?', "%#{names.first}%", "%#{names.last}%", "%#{names.first}%", "%#{names.last}%").order(:first_name)
    else
      where('first_name LIKE ? or last_name LIKE ?', "%#{names.first}%", "%#{names.first}%").order(:first_name)
    end    
  end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end

  def current_friendship(friend)
    friendships.where(friend: friend).first
  end

  private

  def create_chatroom
    chatroom_name = "#{self.first_name}-#{self.last_name}"
    Room.create(name: chatroom_name, user_id: self.id)
  end
end
