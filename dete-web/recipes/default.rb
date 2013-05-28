#
# Cookbook Name:: dete-web
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/var/www/index.html" do
	mode 0664
	source "index.html.erb"
end

directory "/web" do
	owner "root"
	group "www-data"
	mode 02775
	recursive true
	action :create
end

node_handle = node['nfs']['server']
node_handle += ":/web"

mount "/web" do
	device node_handle
	fstype "nfs"
	options "ro"
	#actions [:mount, :enabled]
end
