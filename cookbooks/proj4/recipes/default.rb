bash "Install Proj4" do
user "root"
code <<-EOH
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get update
apt-get install -y libproj-dev
EOH
end
