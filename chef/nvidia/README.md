# nvidia Cookbook

Cookbook to install and configure NVIDIA software and drivers.

## Requirements

Docker cookbook is required for NVIDIA Docker software.

e.g.
### Platforms

- Ubuntu

### Chef

- Chef 12.0 or later


## Attributes

e.g.
### nvidia::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['nvidia']['driver_version']</tt></td>
    <td>String</td>
    <td>Driver version number</td>
    <td>470</td>
  </tr>
</table>

## Usage

### nvidia::default

Include `nvidia` in your node's `run_list` to install NVIDIA driver:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nvidia]"
  ]
}
```

Include `nvidia::docker`` in your node's `run_list` to install NVIDIA Docker software:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nvidia::docker]"
  ]
}
```


## License and Authors

Authors: Jonathan Klinginsmith

