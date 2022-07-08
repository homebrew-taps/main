## 目录说明
- 安装包内如 bin share 等目录会软连接至 /usr/loca/ 目录下
- 如 bin/doggo 会软连接 /usr/local/bin/doggo

## 简介
- Casks：已经编译好的应用包，如图形界面程序等。 如 微信 Chrome
- Formulae：二进制 命令行等软件包，包括了这个软件的依赖、源码位置及编译方法等；


```
测试所有 包
brew tests
安装指定包
brew install --build-from-source <CHANGED_FORMULA>
测试包 测试是否可以正常运行
brew test <CHANGED_FORMULA>
审计包 检查是否有问题 如 license
brew audit --strict <CHANGED_FORMULA>
```
