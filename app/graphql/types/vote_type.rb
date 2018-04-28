Types::VoteType = GraphQL::ObjectType.define do
  name "Vote"

  field :id, types.Int
  field :link, Types::LinkType
  field :user, Types::UserType
end
