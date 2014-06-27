# encoding: UTF-8

path = node['htpasswd']['path']

directory path do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end

node['htpasswd']['files'].each do |name, users|
  file ::File.join(path, "#{name}#{node['htpasswd']['suffix']}") do
    owner 'root'
    group 'root'
    mode 0644
    content users.join("\n")
  end
end
