## chapter 0 课程资料与环境配置

### 课程大纲与对应书籍内容

参考教程为[最经典的SICP](https://www.bilibili.com/video/BV19U4y187U5/?spm_id_from=333.337.search-card.all.click&vd_source=6a2e8fe6292e2cc33457c6e34734309a)

SICP毕竟是一本比较古老的书，采用的语言是Scheme语言.

| **课程名**                           | **阅读材料**                                          | **备注** | **习题** | **进度条**                                  |
| ------------------------------------ | ----------------------------------------------------- | -------- | -------- | ------------------------------------------- |
| 第 1 课：程序设计的基本概念          | SICP 第 1.1 节：The Elements of Programming           |          |          | <progress value="100" max="100"></progress> |
| 第 2 课：递归与迭代                  | SICP 第 1.2 节：Procedures and Processes              |          |          | <progress value="100" max="100"></progress> |
| 第 3 课：高阶函数                    | SICP 第 1.3 节：Higher-Order Procedures               |          |          | <progress value="50" max="100"></progress>  |
| 第 4 课：数据抽象                    | SICP 第 2.1 节：Introduction to Data Abstraction      |          |          | <progress value="" max="100"></progress>    |
| 第 5 课：序列操作                    | SICP 第 2.2 节：Hierarchical Data and Sequences       |          |          | <progress value="" max="100"></progress>    |
| 第 6 课：符号数据                    | SICP 第 2.3 节：Symbolic Data                         |          |          | <progress value="" max="100"></progress>    |
| 第 7 课：多种表示与抽象              | SICP 第 2.4 节：Multiple Representations              |          |          | <progress value="" max="100"></progress>    |
| 第 8 课：系统与通用操作              | SICP 第 2.5 节：Systems with Generic Operations       |          |          | <progress value="" max="100"></progress>    |
| 第 9 课：状态与可变数据              | SICP 第 3.1 节：Assignment and Local State            |          |          | <progress value="" max="100"></progress>    |
| 第 10 课：环境模型                   | SICP 第 3.2 节：The Environment Model                 |          |          | <progress value="" max="100"></progress>    |
| 第 11 课：并发与流                   | SICP 第 3.4 和 3.5 节：Concurrency & Streams          |          |          | <progress value="" max="100"></progress>    |
| 第 12 课：元语言抽象                 | SICP 第 4.1 节：The Metacircular Evaluator            |          |          | <progress value="" max="100"></progress>    |
| 第 13 课：逻辑编程                   | SICP 第 4.4 节：Logic Programming                     |          |          | <progress value="" max="100"></progress>    |
| 第 14 课：寄存器机器模拟器与垃圾回收 | SICP 第 5.2 和 5.3 节：Simulator & Garbage Collection |          |          | <progress value="" max="100"></progress>    |
| 第 15 课：编译器基础                 | SICP 第 5.5 节：Compilation                           |          |          | <progress value="" max="100"></progress>    |

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
