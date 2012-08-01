include_recipe "gdal"
include_recipe "geos"
include_recipe "proj4"
include_recipe "postgres"

package "libxml2-dev"

remote_file "download postgis" do
path "/tmp/postgis-2.0.1.tar.gz"
source "http://postgis.refractions.net/download/postgis-2.0.1.tar.gz"
end

bash "install postgis" do
user "root"
cwd "/tmp"
code <<-EOH
tar xvzf postgis-2.0.1.tar.gz
cd postgis-2.0.1
./configure --without-topology
make -j2
make install
EOH
end

bash "configure postgis" do
user "root"  
code <<-EOH    
createdb  -T template0 -O postgres -U postgres -E UTF8 template_postgis
createlang plpgsql -U postgres -d template_postgis
psql -d template_postgis -U postgres -f /usr/share/postgresql/9.1/contrib/postgis-2.0/postgis.sql
psql -d template_postgis -U postgres -f /usr/share/postgresql/9.1/contrib/postgis-2.0/spatial_ref_sys.sql
ldconfig
EOH
end
