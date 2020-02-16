class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  enum status: {registered: 0, active: 1, suspended: 2, canceled: 3, deleted: 4}

  validates :email, presence:   { message: "é um campo obrigatório e não foi preenchido."},
                    uniqueness: { message: "já cadastrado." }
  validates :name, presence: { message: "é um campo obrigatório e não foi preenchido."}
  validates :terms_of_service, inclusion: { in: [true], message: "não foram aceitos." }
end
