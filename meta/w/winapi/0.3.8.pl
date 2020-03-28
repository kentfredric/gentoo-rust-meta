#!perl
use strict;
use warnings;

crate(
    winapi => '0.3.8',

    features => {
        accctrl                          => [],
        aclapi                           => [],
        activation                       => [],
        appmgmt                          => [],
        audioclient                      => [],
        audiosessiontypes                => [],
        avrt                             => [],
        basetsd                          => [],
        bcrypt                           => [],
        bits                             => [],
        bits10_1                         => [],
        bits1_5                          => [],
        bits2_0                          => [],
        bits2_5                          => [],
        bits3_0                          => [],
        bits4_0                          => [],
        bits5_0                          => [],
        bitscfg                          => [],
        bitsmsg                          => [],
        bluetoothapis                    => [],
        bluetoothleapis                  => [],
        bthdef                           => [],
        bthioctl                         => [],
        bthledef                         => [],
        bthsdpdef                        => [],
        bugcodes                         => [],
        cderr                            => [],
        cfg                              => [],
        cfgmgr32                         => [],
        cguid                            => [],
        combaseapi                       => [],
        coml2api                         => [],
        commapi                          => [],
        commctrl                         => [],
        commdlg                          => [],
        commoncontrols                   => [],
        consoleapi                       => [],
        corsym                           => [],
        d2d1                             => [],
        d2d1_1                           => [],
        d2d1_2                           => [],
        d2d1_3                           => [],
        d2d1effectauthor                 => [],
        d2d1effects                      => [],
        d2d1effects_1                    => [],
        d2d1effects_2                    => [],
        d2d1svg                          => [],
        d2dbasetypes                     => [],
        d3d                              => [],
        d3d10                            => [],
        d3d10_1                          => [],
        d3d10_1shader                    => [],
        d3d10effect                      => [],
        d3d10misc                        => [],
        d3d10sdklayers                   => [],
        d3d10shader                      => [],
        d3d11                            => [],
        d3d11_1                          => [],
        d3d11_2                          => [],
        d3d11_3                          => [],
        d3d11_4                          => [],
        d3d11on12                        => [],
        d3d11sdklayers                   => [],
        d3d11shader                      => [],
        d3d11tokenizedprogramformat      => [],
        d3d12                            => [],
        d3d12sdklayers                   => [],
        d3d12shader                      => [],
        d3d9                             => [],
        d3d9caps                         => [],
        d3d9types                        => [],
        d3dcommon                        => [],
        d3dcompiler                      => [],
        d3dcsx                           => [],
        d3dkmdt                          => [],
        d3dkmthk                         => [],
        d3dukmdt                         => [],
        d3dx10core                       => [],
        d3dx10math                       => [],
        d3dx10mesh                       => [],
        datetimeapi                      => [],
        davclnt                          => [],
        dbghelp                          => [],
        dbt                              => [],
        dcommon                          => [],
        dcomp                            => [],
        dcompanimation                   => [],
        dcomptypes                       => [],
        dde                              => [],
        ddraw                            => [],
        ddrawi                           => [],
        ddrawint                         => [],
        debug                            => [qw( impl-debug )],
        debugapi                         => [],
        devguid                          => [],
        devicetopology                   => [],
        devpkey                          => [],
        devpropdef                       => [],
        dinput                           => [],
        dinputd                          => [],
        dispex                           => [],
        dmksctl                          => [],
        dmusicc                          => [],
        docobj                           => [],
        documenttarget                   => [],
        dpa_dsa                          => [],
        dpapi                            => [],
        dsgetdc                          => [],
        dsound                           => [],
        dsrole                           => [],
        dvp                              => [],
        dwmapi                           => [],
        dwrite                           => [],
        dwrite_1                         => [],
        dwrite_2                         => [],
        dwrite_3                         => [],
        dxdiag                           => [],
        dxfile                           => [],
        dxgi                             => [],
        dxgi1_2                          => [],
        dxgi1_3                          => [],
        dxgi1_4                          => [],
        dxgi1_5                          => [],
        dxgi1_6                          => [],
        dxgidebug                        => [],
        dxgiformat                       => [],
        dxgitype                         => [],
        dxva2api                         => [],
        dxvahd                           => [],
        enclaveapi                       => [],
        endpointvolume                   => [],
        errhandlingapi                   => [],
        everything                       => [],
        evntcons                         => [],
        evntprov                         => [],
        evntrace                         => [],
        excpt                            => [],
        exdisp                           => [],
        fibersapi                        => [],
        fileapi                          => [],
        functiondiscoverykeys_devpkey    => [],
        'gl-gl'                          => [],
        guiddef                          => [],
        handleapi                        => [],
        heapapi                          => [],
        hidclass                         => [],
        hidpi                            => [],
        hidsdi                           => [],
        hidusage                         => [],
        highlevelmonitorconfigurationapi => [],
        hstring                          => [],
        http                             => [],
        ifdef                            => [],
        imm                              => [],
        'impl-debug'                     => [],
        'impl-default'                   => [],
        in6addr                          => [],
        inaddr                           => [],
        inspectable                      => [],
        interlockedapi                   => [],
        intsafe                          => [],
        ioapiset                         => [],
        jobapi                           => [],
        jobapi2                          => [],
        knownfolders                     => [],
        ks                               => [],
        ksmedia                          => [],
        ktmtypes                         => [],
        ktmw32                           => [],
        libloaderapi                     => [],
        limits                           => [],
        lmaccess                         => [],
        lmalert                          => [],
        lmapibuf                         => [],
        lmat                             => [],
        lmcons                           => [],
        lmdfs                            => [],
        lmerrlog                         => [],
        lmjoin                           => [],
        lmmsg                            => [],
        lmremutl                         => [],
        lmrepl                           => [],
        lmserver                         => [],
        lmshare                          => [],
        lmstats                          => [],
        lmsvc                            => [],
        lmuse                            => [],
        lmwksta                          => [],
        lowlevelmonitorconfigurationapi  => [],
        lsalookup                        => [],
        memoryapi                        => [],
        minschannel                      => [],
        minwinbase                       => [],
        minwindef                        => [],
        mmdeviceapi                      => [],
        mmeapi                           => [],
        mmreg                            => [],
        mmsystem                         => [],
        msaatext                         => [],
        mscat                            => [],
        mschapp                          => [],
        mssip                            => [],
        mstcpip                          => [],
        mswsock                          => [],
        mswsockdef                       => [],
        namedpipeapi                     => [],
        namespaceapi                     => [],
        nb30                             => [],
        ncrypt                           => [],
        netioapi                         => [],
        ntddscsi                         => [],
        ntddser                          => [],
        ntdef                            => [],
        ntlsa                            => [],
        ntsecapi                         => [],
        ntstatus                         => [],
        oaidl                            => [],
        objbase                          => [],
        objidl                           => [],
        objidlbase                       => [],
        ocidl                            => [],
        ole2                             => [],
        oleauto                          => [],
        olectl                           => [],
        oleidl                           => [],
        opmapi                           => [],
        pdh                              => [],
        perflib                          => [],
        physicalmonitorenumerationapi    => [],
        playsoundapi                     => [],
        portabledevice                   => [],
        portabledeviceapi                => [],
        portabledevicetypes              => [],
        powerbase                        => [],
        powersetting                     => [],
        powrprof                         => [],
        processenv                       => [],
        processsnapshot                  => [],
        processthreadsapi                => [],
        processtopologyapi               => [],
        profileapi                       => [],
        propidl                          => [],
        propkey                          => [],
        propkeydef                       => [],
        propsys                          => [],
        prsht                            => [],
        psapi                            => [],
        qos                              => [],
        realtimeapiset                   => [],
        reason                           => [],
        restartmanager                   => [],
        restrictederrorinfo              => [],
        rmxfguid                         => [],
        roapi                            => [],
        robuffer                         => [],
        roerrorapi                       => [],
        rpc                              => [],
        rpcdce                           => [],
        rpcndr                           => [],
        sapi                             => [],
        sapi51                           => [],
        sapi53                           => [],
        sapiddk                          => [],
        sapiddk51                        => [],
        schannel                         => [],
        sddl                             => [],
        securityappcontainer             => [],
        securitybaseapi                  => [],
        servprov                         => [],
        setupapi                         => [],
        shellapi                         => [],
        shellscalingapi                  => [],
        shlobj                           => [],
        shobjidl                         => [],
        shobjidl_core                    => [],
        shtypes                          => [],
        spapidef                         => [],
        spellcheck                       => [],
        sporder                          => [],
        sql                              => [],
        sqlext                           => [],
        sqltypes                         => [],
        sqlucode                         => [],
        sspi                             => [],
        std                              => [],
        stralign                         => [],
        stringapiset                     => [],
        strmif                           => [],
        subauth                          => [],
        synchapi                         => [],
        sysinfoapi                       => [],
        systemtopologyapi                => [],
        taskschd                         => [],
        textstor                         => [],
        threadpoolapiset                 => [],
        threadpoollegacyapiset           => [],
        timeapi                          => [],
        timezoneapi                      => [],
        tlhelp32                         => [],
        transportsettingcommon           => [],
        tvout                            => [],
        unknwnbase                       => [],
        urlhist                          => [],
        urlmon                           => [],
        usb                              => [],
        usbiodef                         => [],
        usbspec                          => [],
        userenv                          => [],
        usp10                            => [],
        utilapiset                       => [],
        uxtheme                          => [],
        vadefs                           => [],
        vcruntime                        => [],
        vsbackup                         => [],
        vss                              => [],
        vsserror                         => [],
        vswriter                         => [],
        wbemads                          => [],
        wbemcli                          => [],
        wbemdisp                         => [],
        wbemprov                         => [],
        wbemtran                         => [],
        wct                              => [],
        werapi                           => [],
        winbase                          => [],
        wincodec                         => [],
        wincodecsdk                      => [],
        wincon                           => [],
        wincontypes                      => [],
        wincred                          => [],
        wincrypt                         => [],
        windef                           => [],
        windowsceip                      => [],
        windowsx                         => [],
        winefs                           => [],
        winerror                         => [],
        winevt                           => [],
        wingdi                           => [],
        winhttp                          => [],
        wininet                          => [],
        winineti                         => [],
        winioctl                         => [],
        winnetwk                         => [],
        winnls                           => [],
        winnt                            => [],
        winreg                           => [],
        winsafer                         => [],
        winscard                         => [],
        winsmcrd                         => [],
        winsock2                         => [],
        winspool                         => [],
        winstring                        => [],
        winsvc                           => [],
        winusb                           => [],
        winusbio                         => [],
        winuser                          => [],
        winver                           => [],
        wmistr                           => [],
        wnnc                             => [],
        wow64apiset                      => [],
        wpdmtpextensions                 => [],
        ws2bth                           => [],
        ws2def                           => [],
        ws2ipdef                         => [],
        ws2spi                           => [],
        ws2tcpip                         => [],
        wtypes                           => [],
        wtypesbase                       => [],
        xinput                           => [],
    }
);
