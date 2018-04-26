Mutations::DeleteUser = GraphQL::Relay::Mutation.define do
  name "DeleteUser"
  # TODO: define return fields
  return_field :user, Types::UserType

  # TODO: define arguments
  # input_field :name, !types.String
  input_field :id, types.Int

  resolve ->(obj, args, ctx) {
    # TODO: define resolve function
    user = User.find(args.id).destroy
    { user: user }
  }
end
