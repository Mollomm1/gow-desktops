# gow-desktops
| [Base Images](https://github.com/Mollomm1/gow-bases) | [Desktop Base Images](https://github.com/Mollomm1/gow-desktop-bases) | [Desktop Images](#) |
|-------------- |------|------|

Usable desktops images for Wolf.

| | Name          | Image |
| --- |------------- | ---- |
| <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Zorin_Logomark.svg/1024px-Zorin_Logomark.svg.png" width="48px"> | Zorin OS 17 | ghcr.io/mollomm1/gow-zorin-17:latest |


# Adding to Wolf

To add one of the following configurations to your `config.toml` (by default located at `/etc/wolf/cfg/config.toml`), use the details below:

<details>

<summary>Zorin OS 17</summary>

```toml
[[apps]]
start_virtual_compositor = true
title = 'ZorinOS 17'

    [apps.runner]
    base_create_json = '''{
  "HostConfig": {
    "IpcMode": "host",
    "CapAdd": ["SYS_ADMIN", "SYS_NICE", "SYS_PTRACE", "NET_RAW", "MKNOD", "NET_ADMIN"],
    "SecurityOpt": ["seccomp=unconfined", "apparmor=unconfined"],
    "Ulimits": [{"Name":"nofile", "Hard":10240, "Soft":10240}],
    "Privileged": false,
    "DeviceCgroupRules": ["c 13:* rmw", "c 244:* rmw"]
  }
}
'''
    devices = []
    env = [
        'GOW_REQUIRED_DEVICES=/dev/input/* /dev/dri/* /dev/nvidia*'
    ]
    image = 'ghcr.io/mollomm1/gow-zorin-17:latest'
    mounts = []
    name = 'zorin17'
    ports = []
    type = 'docker'
```
</details>

------
Zorin icon By ArtyomZorin - Own work, CC BY-SA 4.0, https://commons.wikimedia.org/w/index.php?curid=79891602
