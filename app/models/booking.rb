class Booking < ApplicationRecord
  belongs_to :listing
  has_many :missions, through: :listing
  after_create :create_first_checkin_mission, :create_last_checkout_mission

  private

  def create_first_checkin_mission
    create_mission(self.listing.id, 'first_checkin', self.start_date, 10)
  end

  def create_last_checkout_mission
    create_mission(self.listing.id, 'last_checkout', self.end_date, 5)
  end

  def create_mission(listing_id, mission_type, date, price)
    Mission.create(listing_id: listing_id, mission_type: mission_type, date: date, price: self.listing.num_rooms * price)
  end
end
