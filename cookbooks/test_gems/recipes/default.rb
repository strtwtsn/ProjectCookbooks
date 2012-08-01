bash "Check if downloads folder exists" do
code <<-EOH
if [ ! -e "$HOME/Down" ]
then mkdir -p "$HOME/Down"
fi
EOH
end

bash "Download required files" do
code <<-EOH
wget -O /$HOME/Down/spec_helper.rb https://github.com/unepwcmc/SAPI/blob/master/spec/spec_helper.rb
wget -O /$HOME/Down/.rspec https://github.com/unepwcmc/SAPI/blob/master/.rspec
wget -O /$HOME/Down/.travis.yml https://github.com/unepwcmc/SAPI/blob/master/.travis.yml
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

