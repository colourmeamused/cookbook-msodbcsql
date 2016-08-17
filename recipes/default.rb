#
# Cookbook Name:: odbc_sqlserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'selinux_policy::install'
include_recipe 'augeas::geminstall'
include_recipe 'chef-vault'
gem 'ruby-augeas'
case node['platform']
when 'redhat'
  rhsm_repo 'rhel-7-server-fastrack-rpms' do
    action :enable
  end
  package 'unixODBC'
  ark 'msodbcsql' do
    action :install
    checksum node['msodbcsql']['driver_checksum']
    url "#{node['msodbcsql']['base_url']}/msodbcsql-#{node['msodbcsql']['version']}.tar.gz"
    version node['msodbcsql']['version']
  end
  bash "install msodbcsql-#{node['msodbcsql']['version']}" do
    cwd "/usr/local/msodbcsql-#{node['msodbcsql']['version']}"
    code './install.sh install --accept-license'
    only_if '/usr/local/msodbcsql-13.0.0.0/install.sh verify'
  end
  bash 'ldconfig' do
    code 'ldconfig'
    action :nothing
  end
  file '/etc/ld.so.conf.d/msodbcsql.conf' do
    content '/usr/lib64\\n'
    notifies :run, 'bash[ldconfig]', :immediately
  end
end
