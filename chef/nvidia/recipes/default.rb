#
# Cookbook Name:: nvidia
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


driver_version = node['nvidia']['driver_version']

package 'ubuntu-drivers-common' do
  action :install
end

execute 'ubuntu-drivers devices' do
  command 'ubuntu-drivers devices'
end

execute 'apt-get update' do
  command 'apt-get update'
end

package "nvidia-driver-#{driver_version}" do
  action :install
end

execute 'dkms status' do
  command 'dkms status'
end

execute 'nvidia-smi' do
  command 'nvidia-smi'
end