# Digital IC Design: Standard Cells & Prefix Adder Library

## 1. 晶体管逻辑门 (Basic Logic Gates)

| 单元名称 | 描述 | 逻辑表达式  |
| :--- | :--- | :--- |
| **INV** | 反相器 | $Y = \overline{A}$ |
| **NAND2** | 2输入与非门 | $Y = \overline{A \cdot B}$ |
| **AND2** | 2输入与门 | $Y = A \cdot B$ |
| **NOR2** | 2输入或非门 | $Y = \overline{A + B}$ |
| **OR2** | 2输入或门 | $Y = A + B$ |
| **XOR2** | 2输入异或门 | $Y = A \oplus B$ |
| **XNOR2** | 2输入同或门 | $Y = \overline{A \oplus B}$ |
| **BUFFER**| 缓冲器 | $Y = A$ |

---

## 2. 前缀加法器单元 (Prefix Adder Cells)

### **GP Cell (Generate & Propagate 初始生成单元)**
位于加法器输入级。

* **输入：** `A`, `B`
* **输出：** `g`, `p`

**逻辑定义：**

$$
\begin{aligned}
g &= A \cdot B \\
p &= A \oplus B
\end{aligned}
$$

### **Black Cell (完全前缀运算单元)**
前缀树的核心节点。
* **输入：** `Gh`, `Ph`, `Gl`, `Pl`
* **输出：** `Gout`, `Pout`

**逻辑定义：**

$$
\begin{aligned}
G_{out} &= G_h + (P_h \cdot G_l) \\
P_{out} &= P_h \cdot P_l
\end{aligned}
$$

### **Gray Cell (半前缀运算单元)**
只计算生成信号。
* **输入：** `Gh`, `Ph`, `Gl`
* **输出：** `Gout`

**逻辑定义：**

$$
G_{out} = G_h + (P_h \cdot G_l)
$$

### **Buffer GP (缓冲单元)**
用于信号直通。
* **输入：** `Gin`, `Pin`
* **输出：** `Gout`, `Pout`

**逻辑定义：**

$$
\begin{aligned}
G_{out} &= G_{in} \\
P_{out} &= P_{in}
\end{aligned}
$$

---

## 3. 进位链与求和 (Carry Chain & Summation)

### **Carry Cell (进位生成单元)**
* **输入：** `Gpre`, `Ppre`, `Cin`
* **输出：** `Cout`

**逻辑定义：**

$$
C_{out} = G_{pre} + (P_{pre} \cdot C_{in})
$$

### **Sum Cell (求和单元)**
* **输入：** `p`, `Ci`
* **输出：** `Si`

**逻辑定义：**

$$
S_i = p_i \oplus C_i
$$
