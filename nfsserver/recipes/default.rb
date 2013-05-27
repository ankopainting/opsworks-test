#
# Cookbook Name:: nfsserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nfs::server"

directory "/web" do
	owner "root"
	group "www-data"
	mode 4664
	action :create
end

directory "/web/sites/html/default" do
	owner "root"
	group "www-data"
	mode 4664
	action :create
end

directory "/web/sites/apps/default" do
	owner "root"
	group "www-data"
	mode 4664
	action :create
end

directory "/web/configs/managed" do
	owner "root"
	group "root"
	mode 4644
	action :create
end
