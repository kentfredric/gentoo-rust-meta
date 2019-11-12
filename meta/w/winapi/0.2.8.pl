#!perl
use strict;
use warnings;

crate(
    # TODO
    # NOTE: Tests Restricted
    winapi        => '0.2.8',
    missing_tests => 1,
    test          => {
        map { $_ . "-sys" => "^0" }
          qw(
          advapi32      bcrypt    comctl32  comdlg32  credui
          crypt32       d2d1      d3d11     d3d12     d3d9
          d3dcompiler   dbghelp   dsound    dwmapi    dwrite
          dxgi          dxguid    gdi32     hid       httpapi
          kernel32      ktmw32    mpr       netapi32  odbc32
          ole32         oleaut32  opengl32  pdh       psapi
          runtimeobject secur32   setupapi  shell32   shlwapi
          user32        userenv   usp10     uuid      vssapi
          wevtapi       winhttp   winmm     winscard  winspool
          winusb        ws2_32    xinput
          )
    }
);
