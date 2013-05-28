#
# Cookbook Name:: dete-web
# Recipe:: default
#
#
# sets up the web environment for a dete web server
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'

package "libapache2-mod-macro" do
	action :install
	notifies :restart, resources(:service => 'apache2') 
end

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
