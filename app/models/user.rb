class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :exercises
  validates :first_name, presence: true
  validates :last_name, presence: true

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
end
