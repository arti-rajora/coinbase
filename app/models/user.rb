class User < ApplicationRecord
	attr_accessor :gauth_token
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :google_authenticatable, :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable
	has_one :kyc, dependent: :destroy
	has_many :usertaxes, dependent: :destroy
	has_many :wallets, dependent: :destroy
end
