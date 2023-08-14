#
# Cookbook Name:: singularity
# Recipe:: default
#
# Copyright 2022, Jonathan Klinginsmith
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


go_version = node['go']['version']
go_os = node['go']['os']
go_arch = node['go']['arch']

singularity_version = node['singularity']['version']
singularity_download_url = node['singularity']['download_url']
singularity_download_dir = node['singularity']['download_dir']
singularity_checksum = node['singularity']['checksum']
singularity_prefix = node['singularity']['prefix']

execute 'apt-get-update' do
  command 'apt-get update'
end

packages = %w(build-essential libssl-dev uuid-dev libgpgme11-dev squashfs-tools libseccomp-dev wget pkg-config git)
packages.each do |pkg|
  package pkg do
    action :install
  end
end

script 'install go' do
  interpreter 'bash'
  cwd '/tmp'
  code <<-EOH
  wget -q https://dl.google.com/go/go#{go_version}.#{go_os}-#{go_arch}.tar.gz
  sudo tar -C /usr/local -xzf go#{go_version}.#{go_os}-#{go_arch}.tar.gz
  EOH
  creates '/usr/local/go/bin'
end

link '/usr/local/bin/go' do
  to '/usr/local/go/bin/go'
end

remote_file "#{singularity_download_dir}/v#{singularity_version}.tar.gz" do
  source singularity_download_url
  mode '0644'
  checksum singularity_checksum
end

execute 'untar singularity tarball' do
  command "tar -xzf v#{singularity_version}.tar.gz"
  cwd singularity_download_dir
  creates "#{singularity_download_dir}/singularity-#{singularity_version}"
end

script 'install singularity' do
  interpreter 'bash'
  cwd "#{singularity_download_dir}/singularity-#{singularity_version}"
  code <<-EOH
    ./mconfig
    make -C builddir
    make -C builddir install
  EOH
  creates File.join(singularity_prefix, 'bin', 'singularity')
end
