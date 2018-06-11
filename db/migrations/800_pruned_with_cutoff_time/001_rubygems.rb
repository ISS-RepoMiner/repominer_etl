# Load Module
require 'sequel'

# Using Module to creat table
Sequel.migration do
  change do
    create_table(:rubygems) do
      String :id, primary_key: true
      String :gem_name
      Integer :downloads
      String :version
      Integer :version_downloads
      String :platform
      Text :authors
      Text :info
      String :licenses
      Text :metadata
    end
  end
end