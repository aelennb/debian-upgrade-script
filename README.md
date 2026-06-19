# Debian Upgrade Script

这是一个用于简化 Debian 系统版本升级的 Shell 脚本集，支持从旧版本升级到 Debian 12 和 Debian 13。


# 1. 下载脚本到服务器


使用 wget 下载单个脚本

根据你的目标版本，直接下载对应的脚本文件：

# 下载升级到 Debian 12 的脚本
```bash
wget https://raw.githubusercontent.com/aelennb/debian-upgrade-script/main/upgrade_to_12.sh
```


# 下载升级到 Debian 13 的脚本
```bash
wget https://raw.githubusercontent.com/aelennb/debian-upgrade-script/main/upgrade_to_13.sh
```

---

# 2. 赋予脚本执行权限

```bash
chmod +x upgrade_to_12.sh
```
或

```bash
chmod +x upgrade_to_13.sh
```

# 3. 运行升级脚本

重要提示： 升级过程需要 root 权限，请使用 sudo 执行。

```bash
sudo ./upgrade_to_12.sh
```
或

```bash
sudo ./upgrade_to_13.sh
```

---


# 升级过程中的选项说明

在脚本执行过程中，你可能会遇到以下需要手动确认的交互界面。以下是标准的选择建议：

1. 关于重启服务的提示

场景： 当升级像 libpam、libc、libssl 等核心库时，系统会询问是否自动重启相关服务。

建议选择： <Yes> (选择“是”)

原因：

· 选择“Yes”可以避免在每次库升级时都被提示，让脚本自动化完成所有必要的服务重启。

· 这确保了关键服务能正确加载新的库文件，是完成升级的必要步骤，通常不会导致意外问题。


2. 关于修改过的配置文件 (例如 /etc/ssh/sshd_config)

场景： 当新版本的软件包（如 OpenSSH 服务器）带有一个新版配置文件，而你当前的文件已被手动修改过时，系统会询问如何处理。

建议选择： keep the local version currently installed (保留当前安装的本地版本)

原因：

· 这是最安全的选择，能保留你当前服务器的个性化设置（例如 SSH 端口、禁用密码登录等策略），避免因覆盖配置而导致服务不可用或失去远程连接。

· 选择此项后，系统通常会将新版本的配置文件保存为 .dpkg-dist 后缀的文件（如 sshd_config.dpkg-dist）。你可以在升级完成后，再手动对比和合并这些差异。

· 不建议选择“install the package maintainer's version”，这会覆盖你的自定义配置，可能导致 SSH 等关键服务中断。

完成升级

脚本执行完毕后，建议重启一次服务器，以确保所有更新生效且系统状态完全刷新。

```bash
sudo reboot
```

# 注意事项

· 在生产环境执行大版本升级前，务必进行完整的数据备份和系统快照。

· 请确保服务器网络连接稳定。

· 整个升级过程可能需要较长时间，请耐心等待，不要中断脚本执行。
