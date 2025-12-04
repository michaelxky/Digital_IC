# Digital IC Design

## 1. 晶体管逻辑门 (Basic Logic Gates)

| 单元名称 | 描述 | 表达式  |
| :--- | :--- | :--- |
| **INV** | 反相器 | $$Y = \overline{A}$$ |
| **NAND2** | 2输入与非门 | $$Y = \overline{A \cdot B}$$ |
| **AND2** | 2输入与门 | $$Y = A \cdot B$$ |
| **NOR2** | 2输入或非门 | $$Y = \overline{A + B}$$ |
| **OR2** | 2输入或门 | $$Y = A + B$$ |
| **XOR2** | 2输入异或门 | $$Y = A \oplus B$$ |
| **XNOR2** | 2输入同或门 | $$Y = \overline{A \oplus B}$$ |
| **BUFFER**| 缓冲器 | $$Y = A$$ |

---

## 2. 前缀加法器单元 (Prefix Adder Cells)


### **GP Cell (Generate & Propagate 初始生成单元)**
位于加法器输入级，将操作数转换为初始的生成与传播信号。

* **输入：** `A`, `B` (单比特操作数)
* **输出：** `g`, `p`

**逻辑定义：**
$$
\begin{aligned}
g &= A \cdot B \\
p &= A \oplus B
\end{aligned}
$$

### **Black Cell**
前缀树的核心节点（Dot Operator $\bullet$）。用于合并两个相邻区间的信息。
*注：$h$ 代表高位/上层区间 (High)，$l$ 代表低位/下层区间 (Low)。*

* **输入：** `Gh`, `Ph` (高位区间), `Gl`, `Pl` (低位区间)
* **输出：** `Gout`, `Pout` (合并后的区间信号)

**逻辑定义：**
$$
\begin{aligned}
G_{out} &= G_h + (P_h \cdot G_l) \\
P_{out} &= P_h \cdot P_l
\end{aligned}
$$

### **Gray Cell (半前缀运算单元)**
功能与 Black Cell 类似，但只计算生成信号 `G`，不计算传播信号 `P`。

* **输入：** `Gh`, `Ph` (高位区间), `Gl` (低位区间)
* **输出：** `Gout`

**逻辑定义：**
$$
G_{out} = G_h + (P_h \cdot G_l)
$$

### **Buffer GP (缓冲单元)**
用于信号直通

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

前缀树计算完成后，通过以下单元生成最终结果。

### **Carry Cell (进位生成单元)**
将前缀树计算出的区间生成/传播信号与外部进位输入结合，生成该位的实际进位。

* **输入：** `Gpre`, `Ppre` (来自前缀树), `Cin` (加法器整体进位输入)
* **输出：** `Cout` (该位的最终进位，即 $C_{i+1}$)

**逻辑定义：**
$$
C_{out} = G_{pre} + (P_{pre} \cdot C_{in})
$$

### **Sum Cell (求和单元)**
位于加法器末级，计算最终的求和结果。

* **输入：** `p` (当前位的传播信号), `Ci` (当前位的进位输入)
* **输出：** `Si` (求和结果)

**逻辑定义：**
$$
S_i = p_i \oplus C_i
$$
