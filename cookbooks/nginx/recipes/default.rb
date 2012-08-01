package "libcurl4-openssl-dev"
package "build-essential"
package "zlib1g-dev"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "curl"
package "git-core"
package "python-software-properties"

gem_package "passenger" do
action :install
end

execute "compile nginx with passenger" do
command "passenger-install-nginx-module --auto --prefix=/opt --auto-download"
end

# Download startup script

remote_file "download nginx startup script" do
path "/tmp/660-init-deb.sh"
source "http://library.linode.com/assets/660-init-deb.sh"
end

# Install startup script

bash "install startup script for nginx" do
user "root"
cwd "/tmp"
code <<-EOH
mv 660-init-deb.sh /etc/init.d/nginx
chmod +x /etc/init.d/nginx
/usr/sbin/update-rc.d -f nginx defaults
EOH
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true  
end

