Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  #listing all the users.
  field :users, types[Types::UserType] do
    argument :page, types.Int, default_value: 1
    argument :per_page, types.Int, default_value: 1

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
end
