class Api::V1::HealthSerializer < Api::V1::ApplicationSerializer
  attributes :id, :status, :name, :updated_at
end
