# VUnit and GitHub Actions

This repository showcases several approaches for using VUnit in GitHub Actions. Subdir [test](test) contains the sources of an example HDL design, which is tested in the reference workflow: [.github/workflows/test.yml](.github/workflows/test.yml).

ATTENTION: Currently, execution of tests in OCI containers is supported only. Therefore, designs are tested on GNU/Linux only, because running Windows containers is not supported in GitHub Actions.

NOTE: Among the simulators supported by VUnit, GHDL is the only one that can be freely used. Therefore, all these solutions use GHDL. However, the syntax is not constrained by that, so any other OCI image with other supported simulators can be used in private repositories and/or with self-hosted runners.

## Action

Using an Action is the most idiomatic and less verbose solution.

```yml
    runs-on: ubuntu-latest
    steps:

    - uses: actions/checkout@v2

    - uses: VUnit/vunit_action@master
      with:
        cmd: test/run.py
```

### Options

- `cmd`: custom command or path to the VUnit top level Python script. Default: `run.py`.
- `image`: OCI image name to run the tests in. Default: `ghdl/vunit:mcode`.

## Container Job

GitHub Actions workflows have built-in support for a job to be executed in a container. This alternative provides a finer grained definition of the steps to be executed in the container, before running the actual test script(s).

```yml
    runs-on: ubuntu-latest
    container: ghdl/vunit:mcode
    steps:

    - uses: actions/checkout@v2

    - run: test/run.py
```

## Container Step

Running a single step of a workflow inside a container is also supported in GitHub Actions. This solution is similar to the previous one, but allows executing other steps on the host either before or after running the test script(s).

```yml
    runs-on: ubuntu-latest
    steps:

    - uses: actions/checkout@v2

    - uses: docker://ghdl/vunit:mcode
      with:
        args: test/run.py
```
