# Digital_IC
2025_Q2_DigitalIC_Project_16bits_adder

##1.晶体管逻辑门

- INV
- NAND2  
- AND2
- NOR2  
- OR2
- XOR2
- XNOR2  
- BUFFER

## 前缀加法器单元

### **GP Cell（Generate & Propagate 单元）**
**输入：** A，B（单比特）
**输出：** g，p
生成（Generate）：  
    \[
    g = A \cdot B
    \]
传播（Propagate）：  
    \[
    p = A \oplus B
    \]


### **Black Cell（完全前缀组合单元）**
**输入：** Gh，Ph，Gl，Pl  
  （上层区间前缀 Gh,Ph 与下层区间前缀 Gl,Pl）
**输出：** Gout，Pout
合成区间生成：  
    \[
    G_{out} = Gh + (Ph \cdot Gl)
    \]
合成区间传播：  
    \[
    P_{out} = Ph \cdot Pl
    \]


### **Gray Cell（不输出P）**
**输入：** Gh，Ph，Gl  
**输出：** Gout
  \[
  G_{out} = Gh + (Ph \cdot Gl)
  \]


### **Carry Cell（区间前缀 → 实际进位生成）**
**输入：** Gpre，Ppre，Cin
**输出：** Cout（下一位进位）
  \[
  C_{out} = G_{pre} + (P_{pre} \cdot C_{in})
  \]

把前缀树的前缀信号转换为加法器进位。


### **Sum Cell（求和单元）**
**输入：** p，Ci  
**输出：** Si
  \[
  S_i = p_i \oplus C_i
  \]


### **Buffer GP（G/P 结构占位器）**
**输入：** Gin，Pin  
**输出：** Gout，Pout





