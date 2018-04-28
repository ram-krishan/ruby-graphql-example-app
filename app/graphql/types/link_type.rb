Types::LinkType = GraphQL::ObjectType.define do
  name "Link"

  field :id, types.Int
  field :url, types.String
  field :description, types.String
  field :user, Types::UserType
end
