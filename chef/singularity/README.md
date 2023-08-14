# singularity Cookbook

Cookbook to install and configure Singularity container run-time environment.

## Requirements

Go is installed within this cookbook. Refer to the attributes for both Singularity and Go version information.

e.g.
### Platforms

- Ubuntu

### Chef

- Chef 12.0 or later


## Attributes

e.g.
### singularity::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['singularity']['version']</tt></td>
    <td>String</td>
    <td>The Singularity version to install</td>
    <td><tt>3.9.1</tt></td>
  </tr>
  <tr>
    <td><tt>['singularity']['download_url']</tt></td>
    <td>String</td>
    <td>The URL to download the Singularity tarball</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['singularity']['download_dir']</tt></td>
    <td>String</td>
    <td>The directory to download the Singularity tarball</td>
    <td><tt>/tmp</tt></td>
  </tr>
  <tr>
    <td><tt>['singularity']['checksum']</tt></td>
    <td>String</td>
    <td>The SHA-256 checksum of the downloaded tarball</td>
    <td>(checksum value)</td>
  </tr>
  <tr>
    <td><tt>['singularity']['prefix']</tt></td>
    <td>String</td>
    <td>The prefix path of installed location</td>
    <td>/usr/local</td>
  </tr>
  <tr>
    <td><tt>['go']['prefix']</tt></td>
    <td>String</td>
    <td>Go version to install</td>
    <td>1.17.1</td>
  </tr>
  <tr>
    <td><tt>['go']['os']</tt></td>
    <td>String</td>
    <td>Go operation system value</td>
    <td>linux</td>
  </tr>
  <tr>
    <td><tt>['go']['arch']</tt></td>
    <td>String</td>
    <td>Go architecture value</td>
    <td>amd64</td>
  </tr>
</table>

## Usage

### singularity::default

Just include `singularity` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[singularity]"
  ]
}
```

## License and Authors

Authors: Jonathan Klinginsmith

