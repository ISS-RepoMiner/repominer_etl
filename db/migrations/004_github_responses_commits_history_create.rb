require 'sequel'

Sequel.migration do
  change do
    create_table(:repos_raw_responses_commits_history) do
      primary_key :id
      String :repo_name
      String :update_time
      Text :url
      Text :response
      Text :status
    end
  end
end