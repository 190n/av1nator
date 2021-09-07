class User < ApplicationRecord
    devise :rememberable, :omniauthable, omniauth_providers: [:discord]

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.name = "#{auth.info.name}:#{auth.info.discriminator}"
            user.image = auth.info.image
        end
    end
end
