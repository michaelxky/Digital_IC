# Digital IC Design: Standard Cells & Prefix Adder Library

[LINK: VLSI Standard Cell Library](https://www.vlsitechnology.org/html/cells/vgalib013/)

**信号:**
* **Inputs:** $A[15:0]$, $B[15:0]$, $C_{in}$
* **Outputs:** $S[15:0]$, $C_{out}$


## 1. 晶体管逻辑门 (Basic Logic Gates)

| 单元名称 | 描述 | 逻辑表达式 | PMOS W(nm) | PMOS L(nm) | NMOS W(nm) | NMOS L(nm) |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| **INV** | 反相器 | $Y = \overline{A}$ | 180 | 50 | 90 | 50 |
| **INVX2** | 反相器 | $Y = \overline{A}$ | 300 | 50 | 180 | 50 |
| **NAND2** | 2输入与非门 | $Y = \overline{A \cdot B}$ | 180 | 50 | 90 | 50 |
| **AND2** | 2输入与门 | $Y = A \cdot B$ | 180 | 50 | 90 | 50 |
| **NOR2** | 2输入或非门 | $Y = \overline{A + B}$ | 270 | 50 | 135 | 50 |
| **OR2** | 2输入或门 | $Y = A + B$ | 270 | 50 | 135 | 50 |
| **OAI21** | 2-1或与非门 | $Y = \overline{(A + B)\cdot C}$ | 360 | 50 | 180 | 50 |
| **AOI21** | 2-1与或非门 | $Y = \overline{(A \cdot B) + C}$ | 180 | 50 | 90| 50 |
| **XNOR2** | 2输入同或门 | $Y = \overline{A \oplus B}$ | 270 | 50 | 135 | 50 |
| **8T XOR2** | 2输入异或门 | $Y = {A \oplus B}$ | 180 | 50 | 90 | 50 |
| **BUFFER** | 缓冲器 | $Y = A$ | 180 | 50 | 90 | 50 |
| **DBUFFER** | 缓冲器 | $Y = A$ | 600/1200 | 50 | 360/700| 50 |

---
<img width="1179" height="719" alt="XOR10" src="https://github.com/user-attachments/assets/38b446d4-b8eb-48cf-ae76-2e7b6a5a4dbb" />
<img width="1106" height="741" alt="XOR12" src="https://github.com/user-attachments/assets/dc6329c9-f55f-4777-95f8-b3100592c710" />

## 2. 前缀加法器单元 (Prefix Adder Cells)

### **GP Cell (Generate & Propagate 初始生成单元)**

* **输入：** `A`, `B`
* **输出：** `g`, `p`

**逻辑定义：**

$$
\begin{aligned}
g &= A \cdot B \\
p &= A \oplus B
\end{aligned}
$$

可以使用AOI21配合反相器实现

### **Black Cell (完全前缀运算单元)**
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
* **实现：** 双反相器串联


---

## 3. 进位链与求和 (Carry Chain & Summation)

### **Carry Cell (进位生成单元)**
* **输入：** `Gpre`, `Ppre`, `Cin`
* **输出：** `Cout`

**逻辑定义：**

$$
C_{out} = G_{pre} + (P_{pre} \cdot C_{in})
$$

### **Sum Generator (求和单元)**
* **输入：**
    * $p_i$: 预处理级信号
    * $C_{i-1}$: 前缀树上一级进位 (即 $G_{i-1:0}$)
* **输出：** $S_i$

**逻辑定义：**

$$
\begin{aligned}
S_0 &= p_0 \oplus C_{in} \\
S_i &= p_i \oplus C_{i-1} \quad (i > 0)
\end{aligned}
$$

### **Final Carry Out**
* **逻辑：** $C_{out} = G_{15:0}$ (前缀树最终输出)

## 4. 进位输入

在 Bit 0 处增加进位

* **输入：**
    * 来自 Bit 0: $g_0, p_0$
    * 外部输入: $C_{in}$ (作为低位 $G$ 输入)
* **输出：** $G_{0:0}$ (即实际的 $C_0$)

**逻辑定义：**

$$
G_{0:0} = g_0 + (p_0 \cdot C_{in})
$$


---



