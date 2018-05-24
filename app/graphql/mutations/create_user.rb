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
#     errorMessages
#   }
# }

class Mutations::CreateUser < Mutations::BaseMutation
  graphql_name "CreateUser"

  field :user, Types::UserType, null: false
  field :error_messages, [String], null: false

  argument :user, Types::Inputs::CreateUserInput, required: true

  def resolve(user:)
    u = User.new(user.to_h)
    if u.save
      { user: u, error_messages: [] }
    else
      { user: u, error_messages: u.errors.full_messages }
    end
  end
end
