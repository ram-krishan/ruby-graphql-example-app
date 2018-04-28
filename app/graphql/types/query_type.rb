Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  #listing all the users.
  field :users, types[Types::UserType] do
    argument :page, types.Int, default_value: 1
    argument :per_page, types.Int, default_value: 20

    description "User List"
    resolve ->(obj, args, ctx) do
      User.page(args.page).per(args.per_page)
    end
  end

  #user detail
  field :user, Types::UserType do
    argument :id, types.Int
    description "User detail"
    resolve ->(obj, args, ctx) { User.find(args.id) }
  end

  #user detail
  field :userProfile, Types::UserType do
    description "User detail"
    resolve ->(obj, args, ctx) { ctx[:current_user] }
  end
end
