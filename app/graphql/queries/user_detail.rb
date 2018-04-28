Queries::UserDetail = GraphQL::Field.define do
  name "UserDetail"
  description "User detail"

  # type Types::UserType
  argument :id, types.Int
  resolve ->(obj, args, ctx) { User.find(args.id) }
end