## chapter 0 课程资料与环境配置

### 课程大纲与对应书籍内容

课程主页[SICP](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/pages/syllabus/)

课程录像（用的04年，可以和网站内容对上）[04:SICP](https://www.bilibili.com/video/BV1TX4y157hX?spm_id_from=333.788.videopod.episodes&vd_source=6a2e8fe6292e2cc33457c6e34734309a)

SICP毕竟是一本比较古老的书，采用的语言是Scheme语言.

| **Topics**                                                   | **阅读材料**               | **备注**  | **习题**                                  | **进度条**                                  |
| ------------------------------------------------------------ | -------------------------- | --------- | ----------------------------------------- | ------------------------------------------- |
| Introduction to Computation                                  |                            |           |                                           | <progress value="100" max="100"></progress> |
| Scheme Basics                                                | Section 1.1                | Project 0 | Lectures 1-2 exercises                    | <progress value="0" max="100"></progress>   |
| Procedures, Processes, and Recursion                         | Section 1.2                |           | Problem set 1                             | <progress value="0" max="100"></progress>   |
| Orders of Growth and Kinds of Procedures                     | Section 1.2                |           | Lectures 3-4 exercises                    | <progress value="0" max="100"></progress>   |
| Data Abstraction                                             | Section 2.1                |           | Problem set 2                             | <progress value="0" max="100"></progress>   |
| Higher Order Procedures                                      | Section 1.3                | Project 1 | Lectures 5-6 exercises<br />Problem set 3 | <progress value="0" max="100"></progress>   |
| Good Programming Practices                                   |                            |           |                                           | <progress value="0" max="100"></progress>   |
| Using Higher Order Procedures                                | Section 1.3, Section 2.2.4 |           |                                           | <progress value="0" max="100"></progress>   |
| Symbols and Quotation                                        | Section 2.3                |           | Lectures 7-9 exercises                    | <progress value="0" max="100"></progress>   |
| Tagged Data                                                  | Section 2.4                |           | Problem set 4                             | <progress value="0" max="100"></progress>   |
| Advanced Data Types                                          |                            | Project 2 | Lectures 10-11 exercises                  | <progress value="0" max="100"></progress>   |
| Data Mutation                                                | Section 3.3.1-3.3.3        |           |                                           | <progress value="0" max="100"></progress>   |
| Trees, Graphs and Search                                     |                            |           | Lectures 12-13 exercises                  | <progress value="0" max="100"></progress>   |
| Graphs and Search                                            |                            |           | Problem set 6                             | <progress value="0" max="100"></progress>   |
| Environment Model                                            | Section 3.1, Section 3.2   | Project 3 | Lectures 14-15 exercises                  | <progress value="0" max="100"></progress>   |
| Object Oriented Programming I                                |                            |           | Problem set 7                             | <progress value="0" max="100"></progress>   |
| Object Oriented Programming II                               |                            |           | Lectures 16-17 exercises                  | <progress value="0" max="100"></progress>   |
| Object Oriented Programming III                              |                            |           | Problem set 8                             | <progress value="0" max="100"></progress>   |
| Interpretation                                               |                            | Project 4 |                                           | <progress value="0" max="100"></progress>   |
| The Meta-circular Evaluator                                  |                            |           | Lectures 18-20 exercises                  | <progress value="0" max="100"></progress>   |
| Lazy Evaluation                                              | Section 4.1                |           | Problem set 9                             | <progress value="0" max="100"></progress>   |
| Asynchronous Computing                                       | Section 4.2, Section 3.5   |           | Lectures 21-22 exercises                  | <progress value="0" max="100"></progress>   |
| Universal Machines                                           | Section 3.4                |           | Problem set 10                            | <progress value="0" max="100"></progress>   |
| Geometric Folding Algorithms: Origami, Linkages, and Polyhedra |                            | Project 5 | Lectures 23-24 exercises                  | <progress value="0" max="100"></progress>   |
| Peer-To-Peer Computing Research: A Fad?                      |                            |           |                                           | <progress value="0" max="100"></progress>   |
| Computability                                                |                            |           | Lectures 25-26 exercises                  | <progress value="0" max="100"></progress>   |

### 笔记列表

[Building_Abstractions_with_Procedures](./note/Building_Abstractions_with_Procedures.md)

[Building_Abstractions_with_Data](./note/Building_Abstractions_with_Data.md)

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
