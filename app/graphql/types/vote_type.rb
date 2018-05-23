class Types::VoteType  < Types::BaseObject
  graphql_name "Vote"

  field :id, Integer, null: false
  field :link, Types::LinkType, null: false
  field :user, Types::UserType, null: false
end
