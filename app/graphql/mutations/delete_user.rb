class Mutations::DeleteUser < Mutations::BaseMutation
  graphql_name "DeleteUser"

  field :user, Types::UserType, null: false
  field :error_messages, [String], null: false

  argument :id, Integer, required: true

  def resolve(id:)
    u = User.find(id)
    if u.destroy
      { user: u, error_messages: [] }
    else
      { user: u, error_messages: u.errors.full_messages }
    end
  end
end