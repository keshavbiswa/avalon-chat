class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, class_name: "User", foreign_key: :sender_id 
  belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
  validates :sender_id, uniqueness: { scope: :recipient_id }

  scope :between, -> (sender_id, recipient_id) do
    where(sender_id: sender_id, recipient_id: recipient_id).or(
      where(sender_id: recipient_id, recipient_id: sender_id)
    )
  end

  def self.get(sender_id, recipient_id)
    conversation = between(sender_id, recipient_id.to_i).first
    return conversation if conversation.present?

    create!(sender_id: sender_id, recipient_id: recipient_id.to_i)
  end

  def opposed_user(user)
    user == User.find(recipient_id) ? sender : recipient
  end
end