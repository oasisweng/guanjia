# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  belongs_to :store
  has_many :managed_store, class_name: "Store", foreign_key: "manager_id", dependent: :nullify

  has_one :membership_card, dependent: :destroy

  has_many :contacts
  has_many :card_statements, foreign_key: "user_id", 
                             dependent: :destroy
  has_many :operated_card_statements, class_name: "CardStatement", 
                                      foreign_key: "operator_id",
                              dependent: :destroy
  has_many :orders, inverse_of: :user
  has_many :user_coupons
  has_many :coupons, through: :user_coupons
  default_scope -> { order("suspended ASC, full_name DESC") }

  #validates :wechat_id, presence: true
  VALID_PHONE_NO_REGEX = /\A1[358]\d{9}\Z/i
  validates :phone_no, presence: true, 
                    length: {maximum: 11},
                    format: { with: VALID_PHONE_NO_REGEX },
                    uniqueness: true,
                    numericality: true
  validates :full_name, presence: true
  validates :status, presence: true
  validates :store_id, presence: true
  validates_inclusion_of :male, in: [true,false]


  accepts_nested_attributes_for :membership_card


  private 
    def twilio_client
      Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    end

    def send_code
      twilio_client.messages.create(
        to: phone_no,
        from: ENV['TWILIO_PHONE_NUMBER'],
        body: "Your pin number is #{verification_code}, it will expire in one minute"
      )
    end

    def generate_code
      #if verification_code not yet set or time has expired
      if !self.verification_datetime || (Time.zone.now > self.verification_datetime)
        self.verification_code = rand(0000..9999).to_s.rjust(4, "0")
      end
      self.verification_datetime = Time.zone.now + 1.minute
      save
    end

    def verified?(entered_code)
      self.verification_code == entered_code && Time.zone.now < self.verification_datetime
    end

end
