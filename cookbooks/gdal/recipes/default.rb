bash "Install GDAL" do
user "root"
code <<-EOH
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get update
apt-get install -y libgdal-dev gdal-bin
EOH
end

