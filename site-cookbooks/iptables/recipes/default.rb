#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
iptables_file = "/etc/sysconfig/iptables"
 
bash 'move_iptables_original' do
  code <<-EOC
    mv #{iptables_file} #{iptables_file}.org
  EOC
  creates "#{iptables_file}.org"
end
 
service "iptables" do
  supports :status => true, :restart => true
  action [:enable, :start]
end
 
template iptables_file do
  owner "root"
  group "root"
  mode "0600"
  notifies :restart, 'service[iptables]'
end
