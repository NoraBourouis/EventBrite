class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances


  validates :start_date, presence: true
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 4..1000 }
  validates :price, presence: true, length: { in: 1..1000 }
  validates :duration, presence: true, numericality: { greater_than: 0 }, if: :multiple_five
  validates :location, presence: true
 
  
  private
  
  def multiple_five
    if duration % 5 == 0
      return true
    else
      return false
      errors.add(:duration, "it must be a multiple of five")
    end
  end

  def date_not_in_past
    if start_date < DateTime.now
      errors.add(:start_date, "can't be in past")
      end
  end

end

