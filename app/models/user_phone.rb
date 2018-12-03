class UserPhone < ApplicationRecord
  belongs_to :user

  validates :number, presence: true

  before_create :generate_code
  after_create :generate_hash

  def confirmed?
    code.nil?
  end

  private

  def generate_code
    self.code = rand(1000..9999)
  end

  def generate_hash
    self.md5_hash = Digest::MD5.hexdigest(self.number)
    self.save
  end
end
