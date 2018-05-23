# mutation {
#   createUser(input: {
#     user: {
#       firstName: "ram"
#       lastName: "krishan patidar"
#       email: "ram@yopmail.com"
#       password: "12345678"
#     }
#   }){
#     user {
#       email
#       id
#       firstName
#       lastName
#       fullName
#     }
#   }
# }

Mutations::CreateUser = GraphQL::Relay::Mutation.define do
  name "CreateUser"
  # TODO: define return fields
  return_field :user, Types::UserType
  input_field :user, Types::Inputs::CreateUserInput

  # input_field :first_name, !types.String
  # input_field :last_name, !types.String
  # input_field :email, !types.String
  # input_field :mobile_number, types.String
  # input_field :password, !types.String

  resolve ->(obj, args, ctx) {
    user = User.create(args.user.to_h)
    { user: user }
  }
end
