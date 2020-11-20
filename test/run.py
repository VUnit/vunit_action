#!/usr/bin/env python3

from pathlib import Path
from vunit import VUnit

VU = VUnit.from_argv()
VU.add_osvvm()
VU.add_verification_components()

SRC_PATH = Path(__file__).parent / "src"

VU.add_library("lib").add_source_files(
    [SRC_PATH / "*.vhd", SRC_PATH / "test" / "*.vhd"]
)
print([SRC_PATH / "*.vhd", SRC_PATH / "test" / "*.vhd"])

VU.main()
