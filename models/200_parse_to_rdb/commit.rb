# Holds full Commit's information
ConnectToDB.call('parse_responses')
class Commit < Sequel::Model
  many_to_one :repos
  many_to_many :contributors
end
