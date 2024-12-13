[TOC]

# Exercise_Sol

写在前面的话，SICP除了其深邃的函数式编程的思想，其练习题也是很重要很重要的一部分！不做习题约等于没读书！

## chapter 1

### 1.1

![image-20241212233454816](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_1.png?raw=true)

<details><summary>Sol</summary>
    <pre>
        带;开头的表示实际上不会被打印出来
        10
        12
        8
        3
        8 + (-2) = 6
        ; a = 3
        ; b = a + 1 = 4
        (a * b) + b + a = 19
        a = b --> false --> #f
        4
        16
        6
        16
    </pre>
</details>

### 1.2

![image-20241212234712157](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_2.png?raw=true)

<details><summary>Sol</summary>
	<pre>
	本质是一道中缀转前缀的算法题(haha)<a href="https://juejin.cn/post/7123210350484258823">具体可以参考这个文章</a>
	答案(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
	更可读的形式
	(/
	  (+ 5 4
	   ( - 2
	     ( - 3
	        (+ 6
	          ( / 4 5)))))
	  ( * 3
	     (- 6 2)
	     (- 2 7)))
	     </pre>
</details>

### 1.3

![image-20241212235528248](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_3.png?raw=true)

<details>
	 	   <summary>Sol</summary>
    <pre>
	<a href="./Code/Ex1_3.scm">参考代码</a>
	”判断三个数中的较大值可以用如下决策🌲描述“
	   x < y
          /    \
         /      \
        /        \
    x < z         y < z
     / \           / \
    /   \         /   \
x < y  x < y   y < x  y < x
x < z  z < x   y < z  z < y
    </pre>
</details>


### 1.4

![image-20241213002259324](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_4.png?raw=true)

关注点在`((if (> b 0) + -) a b)` if相当于直接返回了一个表达式

### 1.5

![image-20241213002621228](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_5.png?raw=true)

<details><summary>Sol</summary>
	<pre>
	首先解释一下(define (p) (p)),本质定义了一个无限递归的过程，一但调用(p)则会无穷的调用自身。
	如果采用"normal-order evaluation"会先判断 x 是否等于0,而不会调用(p),但如果采用"applicative-order evaluation"则在调用(test o (p))时候就会调用(p)导致无穷递归。
	</pre>
</details>
### 1.6

![image-20241213020222788](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_6.png?raw=true)

<details><summary>Sol</summary>
	<pre>
	注意在Scheme中if并不是个简单的过程，二是个很特殊的形式。只有当第一个谓词为假的时候才会执行第二部分，而由于Scheme采用应用序处理程序，new-if实际上每部分都会被执行，导致上述代码会陷入无限递归从而报错！
	可以参考这个<a href="./Code/Ex1_6.scm">例子</a>,会发现内置的if只打印了good，而自己写的new-if打印了badgood,至于为啥是badgood只是解释器的实现问题而以。
	</pre>
</details>


### 1.7

![image-20241213021023101](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_7.png?raw=true)

<details><summary>Sol</summary>
	<pre>
	本质是浮点数精度问题，优化后的<a href="./Code/Ex1_7.scm">代码</a>
	</pre>
</details>


### 1.8

![image-20241213021245186](https://github.com/juanniaoxx/Function_Programming/blob/main/SICP/assets/Ex1_8.png?raw=true)

<details><summary>Sol</summary>
    <pre>
    </pre>
</details>
