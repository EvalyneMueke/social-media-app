class Notification < ApplicationRecord
  belongs_to :recipient
  belongs_to :sender
end
