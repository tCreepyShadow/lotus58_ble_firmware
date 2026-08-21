# SPDX-License-Identifier: MIT

board_runner_args(nrfjprog "--nrf-family=NRF52" "--softreset")

# Sets the output of the build process to be a .uf2 file
include(${ZEPHYR_BASE}/boards/common/uf2.board.cmake)