default['go']['version'] = '1.17.1'
default['go']['os'] = 'linux'
default['go']['arch'] = 'amd64'

default['singularity']['version'] = '3.9.1'
default['singularity']['download_url'] = "https://github.com/sylabs/singularity/archive/refs/tags/v#{node['singularity']['version']}.tar.gz"
default['singularity']['download_dir'] = '/tmp'
default['singularity']['checksum'] = '41231a9b1a06c4d39af8b904e9838a9f3ce9f762462cb84e412dac936c400f78'
default['singularity']['prefix'] = '/usr/local/'
