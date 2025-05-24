---
marp: true
size: 16:9
theme: am_dark
paginate: true
headingDivider: [2,3]
---

<!-- _class: cover_e -->
<!-- _paginate: "" -->
<!-- _footer: ![](xiaohui.png) -->
<!-- _header: ![](xiaohui2.png) -->

# <!-- fit --> 海南大学2025年毕业论文答辩 

###### ——《基于强场电离时域干涉的光场与库仑相互作用调控研究》

答辩人：韩懿杰
指导老师：刘希望
专业：应用物理学
发布时间：2025 年 5 月 24 日

---

<!-- _header: 目录<br>CONTENTS<br>![](xiaohui2.png)-->
<!-- _class: toc_b -->
<!-- _footer: "" -->
<!-- _paginate: "" -->

- [研究背景](#3)
- [研究内容概述](#8) 
- [理论模型与数值计算](#10)
- [主要研究成果](#16)
- [总结与展望](#27)

## 1. 研究背景
<!-- _class: trans -->
<!-- _footer: "" -->
<!-- _paginate: "" -->
---

<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** **研究背景** *研究内容概述* *理论模型与数值计算* *主要研究成果* *总结与展望*-->
<!-- _class: navbar bq-black footnote-->
</br>

> 1.1 近似模型演化历史
>
> 1993年：高次谐波生成（HHG）**三步模型**的提出，Corkum提出了著名的HHG三步模型[1], 该模型为后续研究提供了理论框架。
> 1994年，Lewenstein模型将HHG过程分为与三步模型类似的三阶段（电离、连续谱传播、激光辅助复合），并通过**鞍点近似**（SPA）计算矩阵元，解决能量守恒方程[2]。
<div class=bdiv>
[1] Corkum P B. Plasma perspective on strong field multiphoton ionization[J]. Phys. Rev.Lett., 1993, 71: 1994.

[2] Lewenstein M, Balcou Ph, Ivanov M Yu, L’Huillier A, Corkum P B. Theory of high-harmonic generation by low-frequency laser fields[J]. Phys. Rev. A, 1994, 49: 2117.
</div>


### HHG三步模型
<!-- _class: cols-2-64 -->

<div class=ldiv>

>During strong-field multiphoton ionization, a wave packet is formed each time the laser field passes its maximum value. <span style="color:red">Within the first laser period after ionization there is a significant probability that the electron will return to the vicinity of the ion with very high kinetic energy.</span> High-harmonic generation, multiphoton two-electron ejection, and very high energy above-threshold-ionization electrons are all conssequences of this electron-ion interaction. One important parameter which determines the strength of these effects is the rate at which the wave packet spreads in the direction perpendicular to the laser electric field; another is the polarization of the laser. It will be essential for experimentalists to be aware of these crucial parameters in future experiments.《Plasma perspective on strong field multiphoton ionization》
</div>

<div class=rimg>

- 隧穿电离：强激光场使电子从原子或分子中隧穿出来。

- 电子加速：电场驱动电子在空间中加速运动。

- 复合发光：电子返回母核并释放高能谐波辐射。

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** **研究背景** *研究内容概述* *理论模型与数值计算* *主要研究成果* *总结与展望*-->
<!-- _class: navbar bq-black footnote-->
</br>

> 1.1 近似模型演化历史
>
> **强场近似**(SFA)理论由 L.V. Keldysh 在其 1965 年发表的论文《Ionization in the Field of a Strong Electromagnetic Wave》中首次提出[3]。
> Arbó等人提出并应用了**库仑-沃尔科夫波近似**（CVA）。通过引入库仑势修正，他们显著提高了对近阈值电离的预测精度，尤其是在短激光脉冲下低能电子行为的描述上[4]。
> Yu等人将CVA方法**应用于正交双色激光场**的研究[5]。他们揭示了库仑效应对光电子动量分布的影响，进一步拓展了CVA在复杂激光场环境中的应用。


<div class=bdiv>

[3] Keldysh L V. Ionization in the field of a strong electromagnetic wave[J]. Sov. Phys.JETP, 1965, 20: 1307-1314.
[4] Arbó D G, Miraglia J E, Gravielle M S, et al. Coulomb-volkov approximation for nearthreshold ionization by short laser pulses[J]. Phys. Rev. A, 2008, 77: 013401
[5] Yu S, Wang Y, Lai X, et al. Coulomb effect on photoelectron momentum distributions
in orthogonal two-color laser fields[J]. Phys. Rev. A, 2016, 94: 033418.
</div>

## 研究的科学与技术意义
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** **研究背景** *研究内容概述* *理论模型与数值计算* *主要研究成果* *总结与展望*-->
<!-- _class: navbar bq-black footnote col1_ol_sq fglass-->

- 探索时空干涉与空间构型的耦合
双色场中的**时空干涉与激光场构型密切相关**，研究其耦合机制有助于揭示电子波包的量子行为。
- 揭示**库仑势的相位调控作用**
库仑势不仅是电子动力学的关键影响因素，还通过相位调控影响干涉图样和光谱特性，为理解强场过程提供了新视角。
- 推动阿秒计量学的发展
通过**精确控制电子动力学**和HHG过程，本研究为阿秒（$10^{-18}$秒）尺度的超快测量技术提供了理论支持，推动了超快光学和量子技术的前沿应用。


## 2. 研究内容概述
<!-- _class: trans -->
<!-- _footer: "" -->
<!-- _paginate: "" -->

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* **研究内容概述** *理论模型与数值计算* *主要研究成果* *总结与展望*-->
<!-- _class: navbar-->

#### 本研究使用了三类激光场：
1. 单色激光场（SC）下的电子动力学研究和模型验证。
2. 等强度正交双色激光场（OTC）的时域干涉机制。
3. 等强度线性偏振非正交双色激光场（NOTC）的时空耦合特性。

#### 采用了两种理论方法：
1. 强场近似（SFA）理论
2. 库仑-沃尔科夫波近似（CVA）理论

特别关注了库仑势在<span style="color:red">周期内和周期间对电子动量分布和能谱</span>的影响，以及时域干涉与空间构型的耦合机制。

## 3. 理论模型与数值计算
<!-- _class: trans -->
<!-- _footer: "" -->
<!-- _paginate: "" -->


## Adams-Bashforth数值积分方法

<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* **理论模型与数值计算** *主要研究成果* *总结与展望*-->
<!-- _class: navbar-->

本文数值积分需要大量前置数值解条件，采用Adams-Bashforth显式积分方法:

$$
y_{n+1} = y_n + h \sum_{j=0}^{k-1} b_j f(t_{n-j}, y_{n-j}),
$$

其迭代公式系数通过对拉格朗日插值多项式的积分计算得出:

$$
b_j = \frac{1}{j!} \int_0^1 l_j^{(k)}(u) \, du,
$$

---

<figure>
  <img src="../graph/order_test/err_analysis.png" alt="Adams-Bashforth方法误差分析" style="width:17cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>误差测试：Adams-Bashforth多步法在不同迭代阶数（1-8阶）和时间步数下的（MSE）分布特征；（a）热图（低时间步数区间）：横轴为时间步数，纵轴为迭代阶数，颜色表示MSE； (b) 折线图（低步数段）：展示k=4-6阶的误差衰减； (c) 热图（高时间步数区间）：高阶方法高于低阶误差区域； (d) 折线图（高步数段）：阶数优势消失。</figcaption>
</figure>

## 强场近似（SFA）理论，忽略库仑势影响

<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* **理论模型与数值计算** *主要研究成果* *总结与展望*-->
<!-- _class: navbar-->

对于振幅共面的强场激光源对束缚态电子的电离，可以忽略传播方向（假如为z方向）的被散射电子的动量分布，于是有：

$$
\frac{d^2P}{dp_x dp_y} = |\mathbf M_p|^2, \label{eq:trans amp}
$$

其中P为总跃迁概率，$dp_xdp_y$ 是动量平面空间面积微元，$\mathbf M_p$ 是跃迁概率密度幅。

在SFA理论中，$M_p$ 可以表示为：

$$
\mathbf M_p = \int_{-\infty}^{\infty} dt \, \langle \psi^V_p(t) | \mathbf{r} \cdot \mathbf{E}(t) | \psi_0(t) \rangle, \label{eq:primal M_p}
$$

其中 $|\psi_0(t)$ 为电子初态, 本文取氢原子，也即 $\psi_0 = \frac{e^{-r}}{\sqrt{4\pi}}$ 。$\mathbf{r} \cdot \mathbf{E}(t)$ 为电偶极矩。SFA理论认为 $\psi^V_p(t)$ 为**跃迁末态Volkov波函数**，其表达式为：

$$
\psi^V_p(t) = \frac{\exp\left\{ i\left[\mathbf{p} + \mathbf{A}(t)\right] \cdot \mathbf{r} \right\}}{(2\pi)^{\frac{3}{2}}} \times \exp\left\{ -i \int_{t}^{\infty} dt' \frac{\left[\mathbf{p} + \mathbf{A}(t')\right]^2}{2} \right\}, \label{eq:volkov state}
$$

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* **理论模型与数值计算** *主要研究成果* *总结与展望*-->
<!-- _class: navbar-->

其中 $\mathbf{p}$ 为空间动量，$\mathbf{A}(t)$ 为矢势， 采用库伦规范，可取 $\mathbf{A}(t) = -\int_{0}^{t} dt' \mathbf{E}(t')$ 。该跃迁概率密度表达式可以写作

$$
\mathbf M_p = - i\int_{-\infty}^{\infty} dt\, \exp{\{iS(\mathbf{p}, t)\}} \langle \mathbf{p} + \mathbf{A}(t) | \mathbf{r} \cdot \mathbf{E}(t) | \psi_0(t) \rangle, \label{eq:simplify M_p}
$$

其中 $\exp{iS(\mathbf{p}, t)}$ 被称为半经典作用量，其表达式为：

$$
S(\mathbf{p}, t) = \int_{t_0}^t \left[ \frac{\left[\mathbf{p} + \mathbf{A}(t')\right]^2}{2} + I_p \right] dt', \label{eq:semi action}
$$

其中 $I_p$ 为原子的电离势，本文取氢原子，也即 $I_p = 0.5$ 。
SFA近似下，如若给定氢原子初态和电离势，跃迁概率密度表达式第二个因子可重写为：

$$
\langle \mathbf{p} + \mathbf{A}(t) | \mathbf{r} \cdot \mathbf{E}(t) | \psi_0(r) \rangle = -i \frac{2^{7/2} (2I_p)^{5/4} [\mathbf{p} + \mathbf{A}(t)] \cdot \mathbf{E}(t)}{\pi \{ [\mathbf{p} + \mathbf{A}(t)]^2 + 2I_p \}^3}. \label{eq:rewrite M_p 2}
$$


## 库仑-沃尔科夫波近似（CVA），考虑库仑修正
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* **理论模型与数值计算** *主要研究成果* *总结与展望*-->
<!-- _class: navbar-->

在CVA理论中，考虑**库仑势对末态波函数的修正**，跃迁矩阵 $\mathbf{M}_p^{\text{CVA}}$ 可表示为：  

$$ 
\mathbf{M}_p^{\text{CVA}} = \int_{-\infty}^{\infty} dt \, \langle \psi_p^{\text{CV}}(t) | \mathbf{r} \cdot \mathbf{E}(t) | \psi_0(t) \rangle. \label{eq:primal M_p_cva}  
$$ 

CVA理论中，末态波函数 $\psi_p^{\text{CV}}(t)$ 库仑-Volkov态由库仑波与Volkov型态相乘构成，其表达式为： 

$$ 
\begin{split}
\psi_{\mathbf{p}}^{\rm CV}(\mathbf{r},t) 
& = D_c(Z_T, \mathbf{p}, \mathbf{r}) \times \frac{\exp\left\{i[\mathbf{p} + \mathbf{A}(t)] \cdot \mathbf{r}\right\}}{(2\pi)^{3/2}} \\
& \times \exp\left\{-i \int_t^\infty dt' \frac{[\mathbf{p} + \mathbf{A}(t')]^2}{2}\right\}, \label{eq:coulomb_volkov}  
\end{split}
$$  

其中出射库仑波定义为：  

$$
D_c(Z_T, \mathbf{p}, \mathbf{r}) = N_T^-(p)_1 F_1(-iZ_T, 1, -ipr - i\mathbf{p} \cdot \mathbf{r}), \label{eq:outgoing wave}
$$  

其中 $N_T^-(p) = \exp(\pi Z_T/2p)\Gamma(1+iZ_T/p)$ 为包含欧拉 $\Gamma$ 函数的库仑归一化因子，$_1F_1$ 表示**合流超几何函数**，$Z_T$ 为原子核电荷数。当 $Z_T=0$ 时，SFA中的库仑-Volkov态退化为Volkov函数。

## 4. 主要研究成果
<!-- _class: trans -->
<!-- _footer: "" -->
<!-- _paginate: "" -->

## 单色激光场（SC）
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar fixedtitleB-->
</br>
<figure>
  <img src="../graph/sc/laser.png" alt="单色激光" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>单色激光：虚线框为周期间干涉时域，也即 [0, T/2] 与 [T, 3T/2] ，后文周期间干涉时域选取与此相同。</figcaption>
</figure>

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
<figure>
  <img src="../graph/sc/sfa/trans_pro_spect_graph.png" alt="SFA框架下跃迁概率分布与光电子能谱特征" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>SFA框架下跃迁概率分布与光电子能谱特征；（a）跃迁概率角分布与（b）光电子能谱随时间演化特征；（a1-a4）分别对应不同时间窗口的极坐标概率分布，（b1-b4）为对应低能区域（[0, 0.2]）能谱。</figcaption>
</figure>

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
<figure>
  <img src="../graph/sc/cva/trans_pro_spect_graph.png" alt="SFA框架下跃迁概率分布与光电子能谱特征" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>引入库伦势修正后, CVA结果展现出显著差异。在极坐标分布中（图a1-a4），低动量区（p<1）出现向心聚集现象，且高动量区（p>1.5）的干涉条纹出现更加复杂的人字形暗纹。可以发现，周期内模式与脉冲长度相对独立。在多周期干涉能谱中（b4），我们观察到相对于SFA不太清晰的周期间峰。2个周期的能谱曲线（b3）被周期内模式调制，以虚线表示。</figcaption>
</figure>

## 正交双色激光场（OTC）
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar fixedtitleB-->
</br>
<figure>
  <img src="../graph/otc/laser.png" alt="单色激光" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
</figure>

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
<figure>
  <img src="../graph/otc/sfa/trans_pro_spect_graph.png" alt="SFA框架下跃迁概率分布与光电子能谱特征" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>SFA框架下跃迁概率分布与光电子能谱特征；（a）跃迁概率角分布与（b）光电子能谱随时间演化特征；（a1-a4）分别对应不同时间窗口的极坐标概率分布，（b1-b4）为对应低能区域（[0, 0.2]）能谱；统一色标采用1/6次方非线性映射以增强弱信号对比。</figcaption>
</figure>

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
<figure>
  <img src="../graph/otc/cva/trans_pro_spect_graph.png" alt="SFA框架下跃迁概率分布与光电子能谱特征" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>CVA框架下跃迁概率分布与光电子能谱特征；（a）跃迁概率角分布与（b）光电子能谱随时间演化特征；（a1-a4）分别对应不同时间窗口的极坐标概率分布，（b1-b4）为对应低能区域（[0, 0.2]）能谱；统一色标采用1/6次方非线性映射以增强弱信号对比。</figcaption>
</figure>

## 非正交双色激光场（NOTC）
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
</br>
<figure>
  <img src="../graph/n_otc85/laser.png" alt="非正交双色激光场" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
</figure>

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
<figure>
  <img src="../graph/n_otc85/cva/trans_pro_spect_graph.png" alt="SFA框架下跃迁概率分布与光电子能谱特征" style="width:27cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>CVA框架下跃迁概率分布与光电子能谱特征；（a）跃迁概率角分布与（b）光电子能谱随时间演化特征；（a1-a4）分别对应不同时间窗口的极坐标概率分布，（b1-b4）为对应低能区域（[0, 0.2]）能谱；统一色标采用1/6次方非线性映射以增强弱信号对比。</figcaption>
</figure>

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
<figure>
  <img src="../graph/n_otc/cva/trans_pro_spect_graph.png" alt="SFA框架下跃迁概率分布与光电子能谱特征" style="width:30cm; display:block; margin-left:auto; margin-right:auto;">
  <figcaption>非正交双色场不同夹角的CVA计算：（a1-a5）极坐标跃迁概率分布，（b1-b5）对应能谱曲线，alpha取值分别为5度,25度,45度,65度,85度；采用1/6次方非线性映射以增强弱信号对比。</figcaption>
</figure>

---
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* **主要研究成果** *总结与展望*-->
<!-- _class: navbar-->
<table style="width:100%;">
  <tr>
    <td style="width:70%;"><img src="../graph/n_otc/cva/amp_contrast.png" alt="SFA框架下跃迁概率分布与光电子能谱特征" style="width:15cm;"></td>
    <td style="width:30%; vertical-align:middle;"><figcaption>非正交双色场夹角扫描的角向分布对比（p=0.62,1.21,1.81）：</br>
    （a）低动量区呈现双峰结构，峰间距随夹角增大；</br>
    （b）中动量区出现移动单峰结构；</br>
    （c）高动量区展现复杂震荡行为。</figcaption></td>
  </tr>
</table>

## 4. 总结与展望
<!-- _class: trans -->
<!-- _footer: "" -->
<!-- _paginate: "" -->

## 主要研究成果
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* *主要研究成果* **总结与展望**-->
<!-- _class: navbar-->

​1. ​理论方法创新​​
* 结合变阶亚当斯-巴什福思积分算法与并行**计算框架**，在强场近似和库仑-沃尔科夫波近似理论下，提出可高效计算时域干涉相关跃迁振幅的模型，适用于单色线偏振场、正交与非正交双色场体系。

​2. ​库仑势与激光场相互作用机制​​
* 验证**库仑势显著聚焦**低动量电子，同时使高动量区干涉图案复杂化，形成高能网格结构。
* 验证**周期内和周期间干涉的独立性**。

​3. ​非正交双色场动力学调控​​
* 激光场夹角变化**调控电子角分布**。
* **预测各个动量区跃迁概率随极角演化行为**。

## 未来研究方向
<!-- _header: \ ***《基于强场电离时域干涉的光场与库......》*** *研究背景* *研究内容概述* *理论模型与数值计算* *主要研究成果* **总结与展望**-->
<!-- _class: navbar-->

​​1. 物理机制扩展​​
* 拓展至**多电子系统**，研究电子关联效应与分子轨道对称性对时域干涉的调制作用。
* 结合**非绝热理论**优化库仑-沃尔科夫波（CVA）模型，探索非正交双色场在阿秒脉冲生成与高次谐波调控中的应用。

​​2. 计算框架优化​​
* 采用**高性能语言（C++/Julia）重构**核心算法，集成GPU并行加速与缓存优化策略，提升复杂体系模拟效率。
* 开发超短脉冲动力学联合实验的量化分析工具，支撑强场超快过程实时观测需求。

---
<!-- _class: lastpage -->
<!-- _footer: "" -->

###### Thank you for listening