# VUnit GitHub action

This action tests your vhdl and verilog code with VUnit!

## Inputs

### `run_file`

**Optional** Path to the VUnit top level Python script. Default `run.py`.

## Example usage
```
uses: VUnit/vunit_action@master
with:
  run_file: path/to/run.py
```

## Test
In `.github/workflows/test.yml` you find an example of use of this action
applied to the `test/` directory.
