# frozen_string_literal: true
require_relative 'spec_helper.rb'

describe 'Github_api_call specifications' do
  it 'should be able new a ApiCall::GithubApiCall object' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.must_be_instance_of ApiCall::GithubApiCall
  end
  it 'should be able to get response from the last_year_commit_activity' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.last_year_commit_activity.status.must_equal 200
  end
  it 'should be able to get response from the contributors_list' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.contributors_list.status.must_equal 200
  end
  it 'should be able to get response from the repo_meta' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.repo_meta.status.must_equal 200
  end
  it 'should be able to get response from the commits_history' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.commits_history.each { |i| i.status.must_equal 200 }
  end
  it 'should be able to get response from the issues' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.issues.each { |i| i.status.must_equal 200 }
  end
  it 'should be able to get response from the last_commits_days' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.last_commits_days.status.must_equal 200
  end
  it 'should be able to get response from the commits_history when using update' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.update(UPDATE_TIME)
    object.commits_history.each { |i| i.status.must_equal 200 }
  end
  it 'should be able to get response from the issues when using update' do
    object = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object.update(UPDATE_TIME)
    object.issues.each { |i| i.status.must_equal 200 }
  end
  it 'should get less row from commits_history when using update' do
    object_all = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object_update = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object_update.update(UPDATE_TIME)
    all_commit = object_all.commits_history
    update_commit = object_update.commits_history
    all_count = 0
    update_count = 0
    all_commit.each { |i| all_count += i.parse.count }
    update_commit.each { |i| update_count += i.parse.count }
    update_count.must_be :<, all_count
  end

  it 'should get less row from issue when using update' do
    object_all = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object_update = ApiCall::GithubApiCall.new(REPO_USER, REPO_NAME, USER_AGENT, ACCESS_TOKEN)
    object_update.update(UPDATE_TIME)
    all_commit = object_all.issues
    update_commit = object_update.issues
    all_count = 0
    update_count = 0
    all_commit.each { |i| all_count += i.parse.count }
    update_commit.each { |i| update_count += i.parse.count }
    update_count.must_be :<, all_count
  end
end
