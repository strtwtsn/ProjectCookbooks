bash "Check if downloads folder exists" do
code <<-EOH
if [ ! -e "$HOME/Downloads" ]
then mkdir -p "$HOME/Downloads"
fi
EOH
end

bash "Download required files" do
code <<-EOH
wget -O /$HOME/Downloads/spec_helper.rb https://github.com/unepwcmc/SAPI/blob/master/spec/spec_helper.rb
wget -O /$HOME/Downloads/.rspec https://github.com/unepwcmc/SAPI/blob/master/.rspec
wget -O /$HOME/Downloads/.travis.yml https://github.com/unepwcmc/SAPI/blob/master/.travis.yml
EOH
end


gem_package "factory_girl" do
action :install
end

gem_package "rspec" do
action :install
end

gem_package "minitest" do
action :install
end

