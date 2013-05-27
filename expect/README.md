expect Cookbook
===============

This cookbook installs expect.

Requirements
------------
Ubuntu


Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### expect::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['expect']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### expect::default

Just include `expect` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[expect]"
  ]
}
```


