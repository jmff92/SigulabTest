class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invitations
  has_many :services
  has_many :items
  has_many :quotes
  has_many :acts
  has_many :specifications

  validates :name, :presence => true
  validates :surname, :presence => true
  validates_exclusion_of :password, in: ->(user) { [user.username] },
                         message: 'no debe ser igual a nombre de usuario'

end
