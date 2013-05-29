#
# Cookbook Name:: web
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

# enable the macro module
apache_module "macro"

template "#{node[:apache][:dir]}/conf.d/macro" do
	mode 0664
	source "macro.conf.erb"
	notifies :reload, resources(:service => 'apache2') 
end

site = "education.qld.gov.au"
template "#{node[:apache][:dir]}/sites-available/#{site}" do
	mode 0664
	source "standard-site.erb"
	variables(:sitename => site)
end
apache_site site


template "/var/www/index.html" do
	mode 0664
	source "index.html.erb"
end

# create directory to be mounted from centralised file server

directory "/web" do
	owner "root"
	group "www-data"
	mode 02775
	recursive true
	action :create
end

# mount directory

node_handle = node[:content_repository_ip] # or node['nfs']['server'])
node_handle += ":/mnt/web"

mount "/web" do
	device node_handle
	fstype "nfs"
	options "ro"
	#actions [:mount, :enabled]
end
