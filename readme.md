mongod 单应用非Docker 快速部署
===

安装
---
- 在当前目录新建 `resources`文件夹。
- 下载mongodb-linux-[任意版本].tgz 放置于该文件夹下

运行以下命令完成安装
```
./install.sh
```

环境部署
---

```
./deploy.sh
```
- 直接运行，将以默认配置来完成部署。以下为默认配置：
  - port：`9808`
  - dbpath: `${basedir}/data/db`
  - logpath: `${basedir}/data/log`
  - 自动生成的配置文件: `${basedir}/lib/conf/mongod.conf`
- 自定义配置运行

  在当前目录新建`conf/mongodb-overlay.conf`，填写自定义配置。再执行部署命令。

> 重复部署，将覆盖上次配置

启动
---
```
./run.sh start
```

关闭
---
```
./run.sh stop
```

