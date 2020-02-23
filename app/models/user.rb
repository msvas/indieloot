class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  belongs_to :plan
  has_many :keys
  has_and_belongs_to_many :games, join_table: "users_games"

  enum status: {registered: 0, active: 1, suspended: 2, deleted: 3, inactive: 4, admin: 9}

  validates :email, presence:   { message: "é um campo obrigatório e não foi preenchido."},
                    uniqueness: { message: "já cadastrado." }
  validates :name, presence: { message: "é um campo obrigatório e não foi preenchido."}
  validates :terms_of_service, inclusion: { in: [true], message: "não foram aceitos." }
  validates :plan_id, presence: { message: "é um campo obrigatório e não foi preenchido."}

  after_initialize :set_default_status, :if => :new_record?

  private

  #define como status padrão 'registered'
  def set_default_status
    self.status ||= :registered
  end

end
