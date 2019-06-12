class Reservation < ApplicationRecord
  belongs_to :listing
  after_create :create_checkout_checkin_mission

  private

  def create_checkout_checkin_mission
    is_last_checkout = Mission.where(listing_id: self.listing_id, mission_type: "last_checkout", date: self.end_date) == [] ? false : true
    if !is_last_checkout
      checkin_mission = Mission.create(listing_id: self.listing_id, mission_type: 'checkin_checkout', date: self.end_date, price: self.listing.num_rooms * 10)
    end
  end
end
