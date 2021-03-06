class User < ApplicationRecord
  has_one :profile
  has_many :pets
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_role

  def assign_role
    if user_type == 'owner'
      add_role :admin
    elsif user_type == 'walker'
      add_role :non_admin
    else
      add_role :poopoo  
    end

  end

end
