## chapter 0 课程资料与环境配置

### 课程大纲与对应书籍内容

参考教程为[最经典的SICP](https://www.bilibili.com/video/BV19U4y187U5/?spm_id_from=333.337.search-card.all.click&vd_source=6a2e8fe6292e2cc33457c6e34734309a)

|                       | 阅读材料 | 习题 | 备注 | 完成度 |
| --------------------- | -------- | ---- | ---- | ------ |
| Lisp 概览             |          |      |      |        |
| 计算过程              |          |      |      |        |
| 高阶过程              |          |      |      |        |
| 复合数据              |          |      |      |        |
| Henderson-Esher的例子 |          |      |      |        |
| 符号化求导系统-引用   |          |      |      |        |
| 模式匹配              |          |      |      |        |
| 通用运算符            |          |      |      |        |
| 赋值、状态和副作用    |          |      |      |        |
| 计算对象              |          |      |      |        |
| 流I                   |          |      |      |        |
| 流II                  |          |      |      |        |
| 云循环求值器I         |          |      |      |        |
| 元循环求值器II        |          |      |      |        |
| 逻辑式程序设计 I      |          |      |      |        |
| 逻辑是程序设计 II     |          |      |      |        |
| 寄存机器              |          |      |      |        |
| 显示控制求值器        |          |      |      |        |
| 编译                  |          |      |      |        |
| 存储分配与垃圾收集    |          |      |      |        |

SICP毕竟是一本比较古老的书，采用的语言是Scheme语言.

### 配置环境

> [!Note]
>
> 配置环境
>
> 方法一：`DrRacket`
>
> 以`DrRacket`作为IDE，从[这里](https://mirrors.tuna.tsinghua.edu.cn/racket-installers/recent/)下载，有`Linux` `macOS` `win`三个版本
>
> linux下载`xxx.sh`版本
>
> ```bash
> cd Downloads
> chmod +x xxxxx.sh
> ./xxxx.sh
> 按默认安装即可
> ```
>
> ![image-20241212202424174](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83(1).png?raw=true)
>
> 点击`file` ---> `package manager` ---> 搜索`sicp`回车、自动下载。
>
> ps:是从github上下载的，请保证网络环境！
>
> 完成后在上方输入`#lang sicp`在点右上`Run`
>
> 下方提示![image-20241212202729093](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/%E9%85%8D%E7%BD%AE%E7%8E%AF%E5%A2%83%EF%BC%882%EF%BC%89.png?raw=true)
>
> 即配置成功！
>
> 方法二：Vscode -- Chez插件 [推荐]
>
> Linux 
>
> ```bash
> sudo  apt-get install chezscheme #Ubuntu
> ```
>
> 查看是否成功
>
> ```bash
> scheme --version
> ```
>
> 去vscode里面下载`vscode-chez`插件和`run-code`插件
>
> 然后在配置文件里面写入
>
> ```json
> {
> "code-runner.executorMap": {
>   "scheme": "scheme"
> },
> "code-runner.clearPreviousOutput": true,
> "code-runner.runInTerminal": true,
> "code-runner.saveFileBeforeRun": true
> }
> 
> ```
>
> 注意macOS用
>
> ```bash
> brew   install  chez
> alias scheme="chez"
> ```

