class Api::V1::UserSerializer < Api::V1::ApplicationSerializer
  attributes :id, :name, :nickname, :image, :uid, :provider, :updated_at, :created_at
end
