class Types::UserType < Types::BaseObject
  field :id, Integer, null: true
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :full_name, String, null: true

  def full_name
    "Mr. #{object.first_name} #{object.last_name}"
  end
  field :email, String, null: true
  field :mobile_number, String, null: true

  def links
    object.links
  end

  field :links, [Types::LinkType, null: true], null: true


  field :votes, [Types::VoteType], null: true

  def votes
    object.votes
  end
end
