Queries::UserProfile = GraphQL::Field.define do
  name("UserProfile")

  type(Types::UserType)

  resolve ->(obj, args, ctx) { ctx[:current_user] }
end