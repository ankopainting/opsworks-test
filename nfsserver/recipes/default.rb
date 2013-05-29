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

disk_location = "/mnt"

directory "#{disk_location}/web" do
	owner "root"
	group "www-data"
	mode 02775
	recursive true
	action :create
end

directory "#{disk_location}/web/sites/html/default" do
	owner "root"
	group "www-data"
	mode 02775
	recursive true
	action :create
end

template "#{disk_location}/web/sites/html/default/index.html" do
	mode 0664
	source "index.html.erb"
end

directory "#{disk_location}/web/sites/apps/default" do
	owner "root"
	group "www-data"
	mode 02775
	recursive true
	action :create
end

directory "#{disk_location}/web/configs/managed" do
	owner "root"
	group "root"
	mode 02775
	recursive true
	action :create
end

nfs_export "#{disk_location}/web" do
	network '172.31.0.0/16'
	writeable false 
	sync true
	options ['no_root_squash','no_subtree_check']
end
