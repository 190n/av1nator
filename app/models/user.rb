class User < ApplicationRecord
    devise :rememberable, :omniauthable, omniauth_providers: [:discord]

    def self.from_omniauth(auth)
        user = where(provider: auth.provider, uid: auth.uid).first_or_create
        user.name = "#{auth.info.name}##{auth.extra.raw_info.discriminator}"
        user.image = auth.info.image
        user.save
        return user
    end
end
