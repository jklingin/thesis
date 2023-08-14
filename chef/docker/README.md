# docker Cookbook

Cookbook to install and configure Docker.

## Requirements
No other cookbooks required

e.g.
### Platforms

- Ubuntu

### Chef

- Chef 12.0 or later


## Attributes
Currently no attributes in the cookbook.

## Usage

### docker::default

Include `docker` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[docker]"
  ]
}
```


## License and Authors

Authors: Jonathan Klinginsmith

