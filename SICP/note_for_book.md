[TOC]

# Structure and Interpretation of computer Programs 2nd

## chapter 0 环境配置

SICP毕竟是一本比较古老的书，采用的语言是Scheme语言，一种典型的语法简单的函数式语言。

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
>  "code-runner.executorMap": {
>      "scheme": "scheme"
>  },
>  "code-runner.clearPreviousOutput": true,
>  "code-runner.runInTerminal": true,
>  "code-runner.saveFileBeforeRun": true
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



## chapter 1 Building Abstractions With Procedures

> # The Elements of Programming
>
> - primitve expressions(原始表达式) 语言的基本单位
> - measn of combination(组合) 如何将基本单位组合成更复杂的结构
> - means of abstraction（抽象）如何用模式或结构简化和组织代码

> [!Note]
>
> *Scheme* 语法知识
>
> 表达式采用前缀表达式(prefix)
>
> - accommodate procedures that may take an arbitrary number of arguments
>
>   - ```Scheme
>     (+ 21 35 12 7)
>     75
>     (* 25 4 12)
>     1200
>     ```
>
> - No ambiguity(歧义) can arise, because the operator is always the leftmost element and the entire combination is delimited(分割) by the parentheses
>
>   - ```scheme
>     (+ (* 3 5)(- 10 6))
>     19
>     (+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6)) 
>     57
>     ; pretty-printing
>     (+ (* 3
>      	       (+ (* 2 4)
>      	           (+ 3 5)))
>     (+ (- 10 7)
>          6))
>     57
>     ```
>
> Naming and the Enviroment
>
> ```scheme
> ; 注意括号是必须的
> (define size 2)
> size
> 2
> (* 5 size)
> 10
> ; pi = 3.14159
> (define pi 3.14159)
> ; radius = 10
> (define radius 10)
> ; pi * r * r
> (* pi (* radius radius))
> 314.159
> ; circumference = 2 * pi * radius
> (define circumference (* 2 pi radius))
> circumference
> 62.8318
> ```
>
> Conditional Expressions and Predicates(谓词)
>
> `cond`(stands for "conditional")
>
> ```scheme
> (define (abs x)
>    (cond ((> x 0) x)
>            ((= x 0) 0)
>            ((< x 0) (- x)))) 
> ; x前的空格千万不能忘记！
> 
> (define (abs x) 
>    (cond ((< x 0) (- x))
>          (else x)))
> 
> (define (abs x)
>   		  (if (< x 0)
>         (- x)
>       x ))
> ```
>
> `<if <predicate>> <consequent> <alternative>`
>
> > [!Caution]
> >
> > `if`并不是一个简单的函数，也是采用中断执行。尤其是在Scheme采用应用序的情况下。具体参考Ex1_6关于`new-if 函数实现`和Scheme内置的`if`的
>
> `not` `and` `or` 再Scheme里面`and` 和 `or` 一样是短路设计的
>
> ```scheme
> (and ( > x 5) ( < x 10)) ;  5 < x < 10
> (define (>= x y) (or (> x y) ( = x y)))
> ; 也可以写成
> (define (>= x y) (not (< x y)))
> ```

### Evaluating Combinations

重点在于`递归(recursion)`解析表达式

- Evaluate the subexpressions of the combination.
- Apply the procedure that is the value of the leftmost subsecpression(the operator) to the arguments that are the values of other subexpressions(the operands)

```scheme
(* ( + 2 ( * 4 6)))
	    (+ 3 5 7))
```

<details><summary>Tree represntation(Try it yourself)</summary>
    <div>
        <img src= "https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/tree_representation.png?raw=true">
    </div>
</details>


> # take care of the primitive cases 
>
> - the values of numerals are the numbers that they name,
> -  the values of built-in operators are the machine instruction sequences that carry out the corresponding operations, and
> - the values of other names are the objects associated with those
>   names in the environment.
>
> >  [!Important]
> >
> > The key point to notice is the role of **the environment in determining the meaning** of the symbols in expressions.

Suche exceptions to the general evaluation rule are called *special forms*.the `define` is the only example of a special form that we have seen so far.

> [!Caution]
>
> **That is, (define x 3) is not a combination.**
>
> ```scheme
> (define x 3)
> ```
>
> **associate x wiht a value.**

### Compound Procedures

**procedure definitions**

**Example 1 to express "squaring"**

```scheme
(define (square x)(* x x))
```

> "We have here a compound procedure,which has been given the name square"

```scheme
<define <<name> <formal paramenters>> <body>>
```

the `name` is a symbol to be assocated with the procedure definition in the enviroment.

```scheme
; x^2 + y^2
(define (sum-of-squares x y)
     (+ (square x) (square y)))
  
  (sum-of-squares 3 4)
  25
  
  (define (f a)
    (sum-of-squares (+ a 1)(* a 2)))
  
  (f 5)
  136
```

<details><summary>Tips</summary>
    <div>
        <p>
        这个例子已经足够震撼了，如果对于刚学完C后人来说(但对于初学python<sup><a href="#footnote1">1</a></sup>的人来说可能司空见惯)。C语言里面函数是不能作为函数的参数的，但Scheme就这么水灵灵的把square 和 sum-of-square当成参数传进进去了，没有繁杂的函数指针，不需要思考类型转换！
        </p>
        <p id="footnote1">
            1. 虽然现在人为了便捷可能大概率会选择python入门，但我还是觉得用C才能更好的建立起CS的大厦。当然互联网民工是不需要的。但如果是想做互联网民工看SICP干吗呢？
        </p>
    </div>
</details>

结构(f 5) --- with the `substitution models` 

```scheme
(f 5)
(+ (square 6) (squrare 10))
(+ (* 6 6)(* 10 10))
(+ 36 100)
136
```



```mermaid
graph TD
A[f]-->|展开为|B[sum-of-squares]
C[5]-->|参数替换|B

    B-->|调用sum-of-squares计算|E[return 136]
    B-->D[展开为square]
   subgraph  黑箱
    D_1[square 6]
    D_2[square 10]
    D-->|替换|D_1
    D-->|替换|D_2
    D_1-->|计算|V_1[36]
    D_2-->|计算|V_2[100]
   V_1 & V_2 -->|+| F[136]
end
 F-->E

```

> [!Caution]
>
> substitution models 只是一个简单的抽象，并非真实的！



结构(f 5) --- with normal-order evaluation[^1]

```scheme
(sum-of-squares (+ 5 1)(* 5 2))
(+ (square (+ 5 1)))      (square (* 5 2)) )
(+ (* (+ 5 1)(+ 5 1))( *(* 5 2) (* 5 2)))
(+ (* 6 6)(* 10 10))
(+ 36 100)
136
```

[^1]:不得不说的一点，这个翻译为正则序到底是谁？计算机里面那么多正则真的无语！

```mermaid
graph TD
A[f]-->|展开为|B[sum-of-squares]
    B-->D[展开为square]
   subgraph  黑箱
	   D-->|展开|D_1[表达式1]
	   D-->|展开|D_2[表达式2]
	 	 	 C[5]
   D_1 & D_2 <-->|代入参数|C
	  	 C-->V_1[square 5 + 1] & V_2[square 5 *2]
	   V_1 --> v_1[6 * 6]
	    V_2 --> v_2[10 * 10]
   end
   	v_1 & v_2 -->|+|R[136]
      B-->|调用sum-of-squares计算|R[return 136]
```

> *normal-order evaluation* is "full expand and then reduce" ,发现只有当表达式完全展开后才会代入值计算。

> [!Important]
>
> 正则序 VS 应用序(applicative-order evaluation)
>
> ​	This alternative “fully expand and then reduce” evaluation method is known as normal-order evaluation, in contrast to the “evaluate the arguments and then apply” method that the interpreter actually uses, which is called applicative-order evaluation.

> [!important]
>
> Lisp uses "applicative-order"!
>
> 即 **先计算所有参数**，然后将这些已计算的结果应用到函数中。

### Example:Square Roots by Newton's Method

> [!NOte]
>
> **Mathematical function VS Computer Procedures**
>
> - Procedures must be effective!
>
> > The contrast between function and procedure is a reflection of the general distinciton between describing properties of things and describing how to do things, or , as it is sometimes referred to, the distinction between **declaratvie knowledge** and **imperative knowledge.**
>
> 举个例子
>
> $\sqrt(x) = the\ y\ such\ that\ y \geq 0\ and\ y^2=x$ 在数学上是合理的，但对于编程来说毫无意义，因为这个只是做了一个事物的描述，而非解决问题的方法。只是告诉你啥是某个数的算术平方根，但没有给出计算的手段。
>
> 而牛顿迭代法就是一种`Imperative knowledge`
>
> [参考链接1](https://math.mit.edu/~stevenj/18.335/newton-sqrt.pdf)
>
> [参考链接2_wiki](https://en.wikipedia.org/wiki/Newton%27s_method)

```mermaid

flowchart TD
subgraph init
X_1[guess] & X_2[x] -->F_1[sqrt]
end
F_1 -->F_2[sqrt-iter]
F_2 --->F_3{good-enough?}
F_3-->|yes|R[guess]
F_3-->|no|F_4[improve]
subgraph No
F_4 -->F_5[average]
end
F_5-->|new guess|F_2
```

参考代码

```scheme
> (define (abs x)
    (if (< x 0)
        (- x)
        x ))
> (define (square x)
    (* x x))
> (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
> (define (improve guess x)
    (average guess(/ x guess)))
> (define (average x y)
    (/ (+ x y) 2))
> (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
> (define (sqrt x)
    (sqrt-iter 1.0 x))
```

> Scheme并没有`for` 和`while`循环，而是用类似于上面代码的各种调用来完成迭代。

![](./assets/递龟.png)

### Linear Recursion and Iteration

**example: factorials function**

$n!=n\times(n-1)\times(n-1)\dots3\times2\times1$

```scheme
; 递归
(define (factorial n)
    (if (= n 1)
        1
        (* n (factorial (- n 1)))))
```

```mermaid
stateDiagram-v2
    [*] --> Start_Factorial
    Start_Factorial --> Check_Base_Case : Is n = 1?
    Check_Base_Case --> End_Result : Return 1
    Check_Base_Case --> Recursive_Call : n > 1
    
    Recursive_Call --> Call_Factorial : Call factorial(n - 1)
    Call_Factorial --> Multiply_Result : Multiply n with result of factorial(n - 1)
    
    Multiply_Result --> Call_Factorial
    Call_Factorial --> End_Result
    
    End_Result --> [*]

```

**substitution model**

![image-20241215201518378](assets/Recursion_1.png)

```scheme
; 迭代实现
(define (factorial_iter n)
    (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter  (* counter product)
                    (+ counter 1)
                    max-count)))
```

```mermaid
stateDiagram-v2
    [*] --> Start_Factorial
    Start_Factorial --> Call_Fact_Iter : Call fact-iter(1, 1, n)
    
    Call_Fact_Iter --> Check_Counter : counter > max-count?
    Check_Counter --> End_Result : Return product
    Check_Counter --> Recursive_Call : counter <= max-count
    
    Recursive_Call --> Update_Product : Multiply counter and product
    Recursive_Call --> Increment_Counter : Increment counter
    Recursive_Call --> Call_Fact_Iter : Recursively call fact-iter with new values
    
    Update_Product --> Increment_Counter
    Increment_Counter --> Call_Fact_Iter
    
    End_Result --> [*]

```



![image-20241215202925164](assets/factorials_iter.png)

> [!Caution]
>
> 一个区别 `recursive procedure` vs `recursive process`
>
> 递归过程(recursive prcedure)指的是实现这个过程中，出现了函数调用函数自身的这个句法事实(syntactiv fact)比如上面的两个其实都是递归过程。
>
> 递归程序(recursive process)指的是这个程序用的是迭代的思想还是递归的思想构造的，比如说例子1,只有一个参数显然的递归思想，第二个每一步都包含完整的重建系统的信息典型的迭代思想。而不是关注语法面上的实现。

> [!NOte]
>
> - 递归所需要的系统资源更多，通过替换模型的模拟可以发现递归的模型是先伸长在压缩，而迭代模型始终只需要3个参数。
>
> - 迭代过程信息足够在任何步恢复程序，但递归有很多信息被隐藏在递归的过程之中，从任意点恢复通常是困难的。



> [!Important]
>
> **Special iteration constructs are syntactic sugar.**
>
> 总结一下，传统的`for` `while`循环在Scheme里面只是`tail recursive`的语法简化(语法🍬)原文如下
>
> > An implementation with this property is called tail-recursive. With a tail-recursive implementation, iteration can be expressed using the ordinary procedure call mechanism, so that special iteration constructs are useful only as syntactic sugar.
>
> 注意，对于支持(Taill Call Optimization)尾递归优化的语言，尾递归可以替换迭代。但如果不具有这种特性，则不能完全替代。递归终究是要申请(call)栈空间，而迭代(jump)不需要。

### Tree Recursion

**Example Fibonacci numbers**

$0, 1, 1, 2, 3, 5, 8, 13, 21,\dots$

![image-20241215222247848](assets/Fibonacci.png)

```scheme
; 递归写法
(define (fib-rec n)
    (cond   ((= n 0) 0)
            ((= n 1) 1)
            (else  (+   (fib-rec (- n 1))
                        (fib-rec (- n 2))))))
```

这个代码与上面求阶乘的代码的区别在与递归的时候会调用两次自己`fib-rec(n-1)`与`fib-rec(n-1)`

展现其`Tree Recursion`

```mermaid
graph TD
    A["fib-rec(5)"] --> B["fib-rec(4)"]
    A["fib-rec(5)"] --> C["fib-rec(3)"]
    B["fib-rec(4)"] --> D["fib-rec(3)"]
    B["fib-rec(4)"] --> E["fib-rec(2)"]
    C["fib-rec(3)"] --> F["fib-rec(2)"]
    C["fib-rec(3)"] --> G["fib-rec(1)"]
    D["fib-rec(3)"] --> H["fib-rec(2)"]
    D["fib-rec(3)"] --> I["fib-rec(1)"]
    E["fib-rec(2)"] --> J["fib-rec(1)"]
    F["fib-rec(2)"] --> K["fib-rec(1)"]
    H["fib-rec(2)"] --> L["fib-rec(1)"]


```

状态转移图

```mermaid
stateDiagram-v2
    [*] --> Start
    Start --> Check_N_Zero : n = 0?
    Start --> Check_N_One : n = 1?
    Start --> Recursive_Call : n > 1
    
    Check_N_Zero --> End_Zero : Return 0
    Check_N_One --> End_One : Return 1
    Recursive_Call --> Recursive_Left : fib-rec(n-1)
    Recursive_Call --> Recursive_Right : fib-rec(n-2)
    Recursive_Left --> Recursive_Left_Done : Return result of fib-rec(n-1)
    Recursive_Right --> Recursive_Right_Done : Return result of fib-rec(n-2)
    Recursive_Left_Done --> Add_Results : Add results of left and right
    Recursive_Right_Done --> Add_Results
    Add_Results --> End_Result : Return sum
    
    End_Zero --> [*]
    End_One --> [*]
    End_Result --> [*]

```

迭代版本

```scheme
; 迭代写法
(define (fib n)
    (fib-iter 1 0 n))
(define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
```

```mermaid
stateDiagram-v2
    [*] --> fib_iter_1 : fib(5)
    fib_iter_1 : a=1, b=0, count=5
    fib_iter_1 --> fib_iter_2 : count != 0
    fib_iter_2 : a=1, b=1, count=4
    fib_iter_2 --> fib_iter_3 : count != 0
    fib_iter_3 : a=2, b=1, count=3
    fib_iter_4:...
    fib_iter_3-->fib_iter_4
    fib_iter_4-->fib_iter_5
    fib_iter_5 --> fib_iter_6 : count != 0
    fib_iter_6 : a=8, b=5, count=0
    fib_iter_6 --> [*] : return 5


```

### Example:Counting change

​	**How many different ways can we make change for $1.00, given half-dollars, quarters, dimes, nickels, and pennies?** More generally, can we write a procedure to compute the number of ways to change any given amount of money?

```mermaid
graph TD
  A[开始: 输入金额 a 和 硬币种类数量 n] --> B{n == 0?}
  B -- 是 --> C[返回 0]  
  B -- 否 --> D{a == 0? or n < 0}
  D -- 是 --> E[返回 1]
  D -- 否 --> F{是否使用第一个硬币种类?}
  F -- 否 --> G[递归调用: 计算 a 使用剩余硬币种类数 n-1]
  F -- 是 --> H[递归调用: 计算 a-d 使用所有硬币种类数 n]
  G --> I[返回结果]
  H --> I
  I --> J[将两者结果相加]
  J --> K[返回结果]

```

简化版，如果是题目的要求应该有5层

```mermaid
graph TD
  A["Make Change(a, n)"] -->| 使用当前硬币 | C["Make Change(a-d, n)"]
  A["Make Change(a, n)"] -->| 不使用当前硬币 | B["Make Change(a, n-1)"]

  B["Make Change(a, n-1)"] -->| 使用当前硬币 | E["Make Change(a-d, n-1)"]
  B["Make Change(a, n-1)"] -->| 不使用当前硬币 | D["Make Change(a, n-2)"]

  C["Make Change(a-d, n)"] -->| 使用当前硬币 | G["Make Change(a-2d, n)"]
  C["Make Change(a-d, n)"] -->| 不使用当前硬币 | F["Make Change(a-d, n-1)"]

  D["Make Change(a, n-2)"] -->| 使用当前硬币 | I["Make Change(a-d, n-2)"]
  D["Make Change(a, n-2)"] -->| 不使用当前硬币 | H["Make Change(a, n-3)"]

  E["Make Change(a-d, n-1)"] -->| 使用当前硬币 | K["Make Change(a-2d, n-1)"]
  E["Make Change(a-d, n-1)"] -->| 不使用当前硬币 | J["Make Change(a-d, n-2)"]

```

