class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  #need to setup mailer for this part
  #:recoverable,
  :rememberable, :trackable, :validatable
  #Setup accessible (or protected) attributes for your model
  has_many :pins
end
