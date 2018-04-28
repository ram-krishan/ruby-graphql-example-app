Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, types.Int
  field :first_name, types.String
  field :last_name, types.String
  field :full_name, types.String do
    resolve ->(user, args, ctx) { "Mr. #{user.first_name} #{user.last_name}" }
  end
  field :email, types.String
  field :mobile_number, types.String

  field :links, -> { types[Types::LinkType] } do
    resolve ->(user, args, ctx) do
      user.links
    end
  end

  # field :votes,[Types::VoteType] do
  # above link will is not work. raising below error.
  # GraphQL::Schema::InvalidTypeError (Field Query.users's return type is invalid: field "votes" type must return GraphQL::BaseType, not Array ([Vote]))

  field :votes,-> { types[Types::VoteType] }  do
    resolve ->(user, args, ctx) { user.votes }
  end
end
