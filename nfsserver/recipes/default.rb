#
# Cookbook Name:: nfsserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nfs::server"
include_recipe "line"

directory "/web" do
	owner "root"
	group "www-data"
	mode 02775
	action :create
end

directory "/web/sites/html/default" do
	owner "root"
	group "www-data"
	mode 02775
	recursive true
	action :create
end

directory "/web/sites/apps/default" do
	owner "root"
	group "www-data"
	mode 02775
	recursive true
	action :create
end

directory "/web/configs/managed" do
	owner "root"
	group "root"
	mode 02775
	recursive true
	action :create
end

nfs_export "/web" do
	network '172.31.0.0/16'
	writeable false 
	sync true
	options ['no_root_squash']
end
