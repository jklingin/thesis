#
# Cookbook Name:: docker
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


packages = %w(apt-transport-https ca-certificates curl software-properties-common)

packages.each do |pkg|
  package pkg do
    action :install
  end
end

execute 'add docker gpg key' do
  command 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -'
  not_if 'apt-key fingerprint 0EBFCD88 | grep -q docker'
end

script 'setup stable repo' do
  interpreter "bash"
  code <<-EOH
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
  EOH
end

execute 'apt-get update' do
  command 'apt-get update'
end

package 'docker-ce' do
  action :install
end
