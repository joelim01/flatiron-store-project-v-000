class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :orders, through: :carts


  def current_cart
    self.carts.find_by(status: "current")
  end

  def current_cart=(cart)
    if cart && cart.line_items
      if self.current_cart
        self.current_cart.line_items = cart.line_items
        self.current_cart.save
      else
        cart.status = "current"
        cart.save
      end
    else
      self.carts.first_or_create(status: "current").line_items.clear
    end
  end
end
