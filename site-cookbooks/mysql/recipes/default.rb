#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
=begin

case node["platform"]
when "centos"
  yum_repository "mysql-5.6" do
    url "http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm"
    action :add
  end
end
=end

package "mysql-server" do
  action :install
  #ersion "5.6"
end

service "mysqld" do
  action [ :enable, :start ]
end

