class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }

  def total_spent
    sum = 0.0
    orders.where(status: "completed").each do |order|
      sum += order.total
    end
    sum
  end
end
