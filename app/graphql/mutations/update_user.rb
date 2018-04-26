Mutations::UpdateUser = GraphQL::Relay::Mutation.define do
  name "UpdateUser"

  return_field :user, Types::UserType

  input_field :id, !types.Int
  input_field :first_name, types.String
  input_field :last_name, types.String
  input_field :email, types.String
  input_field :mobile_number, types.String
  input_field :password, types.String

  resolve ->(obj, args, ctx) {
    user = User.find(args.id)
    user.update(args.to_h)
    { user: user }
  }
end
