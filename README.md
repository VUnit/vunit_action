<p align="center">
  <a title="vunit.github.io"
     href="http://vunit.github.io"
  ><img src="https://img.shields.io/website.svg?label=vunit.github.io&longCache=true&style=flat-square&url=http%3A%2F%2Fvunit.github.io%2Findex.html"
  /></a><!--
  -->
  <a title="Join the chat at https://gitter.im/VUnit/vunit"
     href="https://gitter.im/VUnit/vunit"
  ><img src="https://img.shields.io/gitter/room/VUnit/vunit.svg?longCache=true&style=flat-square&logo=gitter&logoColor=4db797&color=4db797"
  /></a><!--
  -->
  <a title="@VUnitFramework"
     href="https://www.twitter.com/VUnitFramework"
  ><img src="https://img.shields.io/twitter/follow/VUnitFramework.svg?longCache=true&style=flat-square&color=1DA1F2&label=%40VUnitFramework&logo=twitter&logoColor=fff"
  /></a><!--
  -->
  <a title="'Test' workflow Status"
     href="https://github.com/VUnit/vunit_action/actions?query=workflow%3ATest"
  ><img alt="'Test' workflow Status" src="https://img.shields.io/github/workflow/status/VUnit/vunit_action/Test?longCache=true&style=flat-square&label=Test"
  /></a>
</p>


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
