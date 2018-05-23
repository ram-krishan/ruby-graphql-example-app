class Types::LinkType < Types::BaseObject
  graphql_name "Link"

  field :id, Integer, null: false
  field :url, String, null: true
  field :description, String, null: true
  field :user, Types::UserType, null: true
end
