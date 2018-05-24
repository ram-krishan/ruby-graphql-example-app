# mutation {
#   updateUser(input: { user: {
#       id: 106
#       firstName: "ram 106"
#   }
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

class Mutations::UpdateUser < Mutations::BaseMutation
  graphql_name "UpdateUser"

  field :user, Types::UserType, null: false
  field :error_messages, [String], null: false

  argument :user, Types::Inputs::UpdateUserInput, required: true

  # argument :id, Integer, required: true
  # argument :first_name, String, required: false
  # argument :last_name, String, required: false
  # argument :email, String, required: false
  # argument :mobile_number, String, required: false
  # argument :password, String, required: false

  def resolve(user:)
    id = user.to_h.delete(:id)
    u = User.find(id)
    if u.update(user.to_h)
      { user: u, error_messages: [] }
    else
      { user: u, error_messages: u.errors.full_messages }
    end
  end
end