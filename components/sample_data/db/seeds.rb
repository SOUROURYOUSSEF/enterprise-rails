def load_seeds(model)
  puts "Loading #{model} ..."
  load "#{SampleData::Engine.root}/db/seeds/#{model}.rb"
end

load_seeds "users"
# load_seeds "workspaces"
# load_seeds "datasets"
# load_seeds "associated_datasets"
#load_seeds "workfiles"