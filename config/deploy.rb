set :application, "sample_app"
set :repo_url, "https://github.com/shizunaito/rails-tutorial.git"
set :branch, "master"
set :rails_env, 'production'

task :start do
  on roles(:web) do
    execute "sudo systemctl start puma"
  end
end

task :stop do
  on roles(:web) do
    execute "sudo systemctl stop puma"
  end
end

task :restart do
  on roles(:web) do
    execute "sudo systemctl restart puma"
  end
end
