require "graphql/rake_task"
require "rake"

GraphQL::RakeTask.new(
  load_schema: -> (_task) {
    require_relative '../../app/graphql/back_end_schema'
    BackEndSchema
  }
)

namespace :graphql do
  task export: :environment do
    Rake::Task["graphql:schema:dump"].invoke
  end
end
