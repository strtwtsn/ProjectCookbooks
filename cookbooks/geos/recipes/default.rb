bash "Install GEOS" do
user "root"
code <<-EOH
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get update
apt-get install -y libgeos-dev
EOH
end


