bash "Install Postgres" do
user "root"
code <<-EOH
add-apt-repository ppa:pitti/postgresql
apt-get update
apt-get install -y postgresql-9.1 postgresql-server-dev-9.1 postgresql-contrib-9.1 postgresql-plpython-9.1
EOH
end

gem_package "pg" do
  action :install
end 

service "postgresql" do
  service_name "postgresql"
  supports :restart => true, :status => true, :reload => true
end


template "/etc/postgresql/9.1/main/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
  notifies :restart, resources(:service => "postgresql"), :immediately
end

