bash "Copy default .gitignore file" do
code <<-EOH
cp /var/chef/cookbooks/gitignore/files/default/.gitignore /$HOME/Down/.gitignore
EOH
end

