class User < ActiveRecord::Base
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  after_save :send_mail_after_confirm, if: :confirmed_at_changed?, 
              unless: :confirmed_at_was

  has_many :orders
  
  validates :role, presence: true

  def role_symbols
    [role.title.to_sym]
  end

  def send_mail_after_confirm
    UserMailer.after_confirm_email(email).deliver_now
  end
end
