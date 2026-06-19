# 🚀 Debian Upgrade Script

一键式 Debian 系统大版本升级工具，支持从任意旧版本安全升级至 Debian 12 (Bookworm) 或 Debian 13 (Trixie)。


---


 # 1️⃣ 下载脚本

根据目标版本，使用 wget 下载对应的脚本文件：

 升级到 Debian 12
```bash
wget https://raw.githubusercontent.com/aelennb/debian-upgrade-script/main/upgrade_to_12.sh
```


 升级到 Debian 13
```bash
wget https://raw.githubusercontent.com/aelennb/debian-upgrade-script/main/upgrade_to_13.sh
```

---

 # 2️⃣ 赋予执行权限

```bash
chmod +x upgrade_to_12.sh
```
或

```bash
chmod +x upgrade_to_13.sh
```

---

 # 3️⃣ 以 root 权限运行

```bash
sudo ./upgrade_to_12.sh
```

或
```bash
 sudo ./upgrade_to_13.sh
```

---

 # ⚙️ 升级过程中的交互选项说明

脚本执行时，可能会出现需要手动确认的界面。以下是标准推荐操作，请按此处理以确保升级顺利：

---

🔄 关于重启服务的提示

· 出现场景：升级 libpam、libc、libssl 等核心库时。

· 建议选择：<Yes>（是）

· 原因：
    选择“Yes”可避免每次库升级都被打断，让脚本自动完成所有必要的服务重启。这是保证服务正确加载新库的关键步骤，通常不会引发问题。

---

📝 关于已修改的配置文件（如 /etc/ssh/sshd_config）

· 出现场景：新软件包带有新版配置文件，而当前文件已被手动修改过。

· 建议选择：keep the local version currently installed（保留当前本地版本）

· 原因：
    这是最安全的选择，可保留你的个性化设置（如 SSH 端口、密码登录策略等），避免因配置覆盖导致服务中断或远程连接丢失。
    新配置会另存为 .dpkg-dist 后缀文件（如 sshd_config.dpkg-dist），你可以在升级完成后手动对比合并。

⚠️ 不建议选择“install the package maintainer's version”，这会覆盖你的自定义配置，可能引发关键服务异常。

---

 # ✅ 升级完成后的收尾工作

脚本执行完毕后，强烈建议重启服务器，使所有更新生效并刷新系统状态：

```bash
sudo reboot
```

---

 # 📌 重要注意事项

事项 说明

🛡️ 备份先行 生产环境升级前，务必完成完整数据备份和系统快照。

🌐 网络稳定 确保服务器网络连接可靠，避免中途中断。

⏳ 耐心等待 升级过程耗时较长，请勿中途强制终止脚本。


---

Happy Upgrading! 🎉
