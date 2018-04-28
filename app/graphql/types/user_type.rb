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
end
