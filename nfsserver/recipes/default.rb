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
	mode 04664
	action :create
end

directory "/web/sites/html/default" do
	owner "root"
	group "www-data"
	mode 04664
	recursive true
	action :create
end

directory "/web/sites/apps/default" do
	owner "root"
	group "www-data"
	mode 04664
	recursive true
	action :create
end

directory "/web/configs/managed" do
	owner "root"
	group "root"
	mode 04644
	recursive true
	action :create
end

nfs_export "/web" do
	network '172.31.28.0/24'
	writeable false 
	sync true
	options ['no_root_squash']
end
