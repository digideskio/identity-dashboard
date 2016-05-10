class Application < ActiveRecord::Base
  belongs_to :user

  enum block_encryption: { 'aes256-cbc' => 1 }

  before_create :create_issuer

  def create_issuer
    unless self.issuer.present?
      self.issuer = SecureRandom.uuid
    end
  end
end
