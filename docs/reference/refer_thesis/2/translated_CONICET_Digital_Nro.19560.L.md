# **亚周期整形激光脉冲原子电离中电子波包的干涉**

Diego G. Arbo,<sup>1,*</sup> Stefan Nagele,<sup>2</sup> Xiao-Min Tong,<sup>3</sup> Xinhua Xie,<sup>4</sup> Markus Kitzler,<sup>4</sup> 和 Joachim Burgdorfer<sup>2</sup>

<sup>1</sup>*天文学与空间物理研究所，IAFE（CONICET-UBA），CC 67，Suc. 28（1428）布宜诺斯艾利斯，阿根廷*

<sup>2</sup>*理论物理研究所，维也纳工业大学，Wiedner Hauptstrasse 8-10/136，A-1040 维也纳，奥地利，欧盟*

<sup>3</sup>*纯科学与应用科学研究生院，筑波大学计算科学中心，筑波 305-8577，日本*

<sup>4</sup>*光子学研究所，维也纳工业大学，Gusshausstrasse 27/387，A-1040 维也纳，奥地利，欧盟*

（2014年1月16日接收；2014年4月16日发表）

我们对由频率为*ω*和2*ω*的线性偏振整形双色激光脉冲产生的原子光电子发射谱进行了理论分析。中等能量的"直接"电子谱显著地表现出**周期内**和**周期间**干涉。我们基于时间依赖扭曲波强场近似的半经典近似，推导了一个适用于双色脉冲强场电离的简单解析表达式。通过与时间依赖薛定谔方程的精确解及强场近似的比较，验证了该表达式能够近似表征复杂的干涉图样。我们证明，通过调节双色分量间的相对相位这一额外"旋钮"，可以调控干涉图样并增强其对比度。本研究证实双色电离可解析出源于100阿秒内发射轨迹的干涉结构[X. Xie等，[物理评论快报](http://dx.doi.org/10.1103/PhysRevLett.108.193004) **[108](http://dx.doi.org/10.1103/PhysRevLett.108.193004)**, [193004](http://dx.doi.org/10.1103/PhysRevLett.108.193004) [（2012）](http://dx.doi.org/10.1103/PhysRevLett.108.193004)]。

DOI: [10.1103/PhysRevA.89.043414](http://dx.doi.org/10.1103/PhysRevA.89.043414) PACS编号: 32.80.Rm, 32.80.Fb, 03.65.Sq

#### **I. 引言**

阈上电离（ATI）和高次谐波产生（HHG）是强激光脉冲诱导的高度非线性量子现象。电子通过原子势与外加强场形成的势垒隧穿发射。隧穿主要发生在每个光周期内电场绝对值最大的时刻附近。根据三步模型，光电子可分为**直接**电子与**再散射**电子[1]。直接电子脱离原子后不与残余离子发生再散射即可逃逸，而少量电子会被驱动返回离子核（"再散射"）并在离子场与激光场的共同作用下加速至高能态。经典轨迹在分析光电子谱干涉图样形成中起关键作用[2,3]。近单周期脉冲中的时间双缝干涉已被实验[4,5]和理论[6]研究，ATI的时间-能量分析近期也有报道[7]。角分布中近阈振荡被解释为电子轨迹干涉[8-10]，最近Marchenko等完成了实验测量[11]。飞秒脉冲固定频率下，He原子电离[5]和F<sup>−</sup>离子光剥离[12]中已观测到衍射条纹，后者过程的理论分析见文献[13]。多周期光电子谱中的干涉图样可视为**周期内**（或亚周期）与**周期间**干涉构成的时间光栅衍射图[2,3,13,14]。周期间干涉产生众所周知的ATI峰，而周期内干涉导致ATI谱调制，可揭示亚周期电离动力学[2,3,14]。对于单色激光场，该分析基于强场近似（SFA）的广泛使用的半经典近似[15][16-23]。类似调制也出现在激光辅助俄歇衰变谱中，其边带总体结构被解释为电子在一个周期内发射的干涉[24]。

近年来，采用基频及其低次谐波组成的双色场研究了ATI[25-27]、电离控制[28]、二向色性[29,30]、分子取向[31]及电子动量分布干涉条纹调控[32]。脉冲波形由双色分量的相对相位*ϕ*决定，实现了这些原子过程的**相干相位控制**[25]。整形激光脉冲的亚周期电离动力学观测已在多周期脉冲和低分辨谱中实现[32]。据我们所知，目前尚未对双色激光原子电离干涉图样[32]进行系统的半经典分析。

本文聚焦于主导低能区总电离产额和微分动量谱的直接光电子。近红外（NIR）激光场驱动返回离子核并发生再散射的光电子贡献相对较小，在分析周期内/间干涉时将予忽略。我们将单色场时间光栅的半经典分析[2,3,13,14]推广至含基频与二次谐波（*ω*-2*ω*）的双色脉冲情形，以下称此描述为半经典模型（SCM）。通过与（基本精确的）时间依赖薛定谔方程（TDSE）数值解及SFA数值结果的比较，校准了**解析**SCM的结果。虽然SCM无法精确复现TDSE结果，但为理解干涉结构提供了详细...

<sup>*</sup>diego@iafe.uba.ar

<span id="page-1-0"></span>深入探究不同发射时刻释放的波包之间的干涉效应，这些干涉构成了干涉图案的物理基础。

我们分析了周期间（intercycle）与周期内（intracycle）干涉对相对相位φ的依赖关系。关键发现是：当相对相位取特定值时，沿偏振轴的电子发射会呈现高度不对称性，使电子分布延伸至高动能区域，从而有利于观测周期内干涉图案，并最大化周期内干涉条纹的对比度。本文旨在强调由不同发射时刻释放的波包叠加所产生的干涉效应。在分析中，我们将主要依赖半经典模型（SCM），该模型不仅允许对问题进行解析处理，还能明确分解干涉图案中的不同贡献——这与直接求解含时薛定谔方程（TDSE）不同，极大地促进了对该过程的理论理解。

论文结构如下：第二节概述了用于计算双色多周期激光脉冲激发原子光电子发射的三种方法：(i) 含时薛定谔方程（TDSE）；(ii) 含时畸变波强场近似（SFA）[16–23]；(iii) SFA的半经典简化版本（称为SCM模型，也常称作"简单人模型"[15]）。第三节通过对比TDSE、SFA和SCM的计算结果，证明SCM能定性复现复杂的干涉条纹。第四节利用SCM分析周期间与周期内干涉的相互作用，并展示谐波间相对相位可作为调节干涉条纹对比度的控制参数。

#### **二、理论方法**

我们考虑目标原子与频率为ω和2ω的双色激光脉冲相互作用。脉冲通过沿ẑ方向的含时电场F(t)描述：

$$\ddot{F}(t) = f(t) \left[ \cos(\omega t) + \cos(2\omega t + \varphi) \right] \hat{z},\tag{1}$$

其中ω为基频激光频率，φ为相对相位，f(t)是整形激光脉冲的包络函数。假设两谐波振幅相等以最大化双色效应，并将相对相位φ作为调控电场F(t)亚周期时间结构的参数（见图1）。

长度规范下的系统哈密顿量为：

$$H = H\_0 + z \, F\left(t\right),\tag{2}$$

其中H₀为未微扰原子哈密顿量：

$$H\_0 = \frac{\vec{p}\,^2}{2} + V(r) \,, \tag{3}$$

采用库仑势V(r)=-1/r描述原子实势，p为电子正则动量，r为电子位置。电子从满足定态薛定谔方程

$$H\_0|\phi\_i\rangle = E|\phi\_i\rangle\tag{4}$$

的初始束缚态|φi⟩（结合能E=-Ip）到脉冲后未微扰终态|φf⟩的跃迁，由含时薛定谔方程

$$i\frac{\partial}{\partial t}|\psi(t)\rangle = H|\psi(t)\rangle\tag{5}$$

的解决定。

电子以末态动量k和能量εf=k²/2（k=|k|）发射，其动量分布可通过跃迁矩阵元计算：

$$\frac{d\,P}{d\vec{k}} = |T\_{if}|^2,\tag{6}$$

Tif对应|φi⟩→|φf⟩跃迁。能谱可表示为dP/dE=2π∫d(cosθ)√2E|Tif|²（θ为k与偏振方向ẑ夹角），纵向动量分布为dP/dkz=2π∫₀^∞dkρkρ|Tif|²（kρ为垂直偏振轴的动量分量）。本文将通过三种方法计算Tif：(i) 求解TDSE；(ii) 含时畸变波强场近似；(iii) 半经典近似。

#### **A. 含时薛定谔方程**

我们在偶极近似下数值求解TDSE（方程5），分别采用长度规范（方程2）和速度规范（用p·A(t)替代z·F(t)）[33]。波函数通过球谐函数展开（分波展开），径向部分采用伪谱网格表示。实空间分为内区（R<Rc）和外区（Rc<R<Rmax）。含时波函数传播采用伪谱分裂算子法[34]，外区连续态展开为库仑波函数后进一步解析传播为Volkov动量态[35]。已验证电子能谱计算结果与规范选择无关。

#### **B. 含时畸变波强场近似**

在含时畸变波理论中[36]，后形式跃迁振幅表示为：

$$T\_{if} = -i \int\_{-\infty}^{+\infty} dt \,\left< \chi\_f^-(t) | z \, F(t) \, | \phi\_i(t) \right> \,,\tag{7}$$

其中χf⁻(t)为终态畸变波函数，初始态|φi(t)⟩的时间演化由方程5和原子哈密顿量方程3决定。本文选择χf⁻为长度规范下哈密顿量Hf=p²/2+zF(t)的解，对应时变电场中的自由电子（出射道畸变哈密顿量）。\frac{\partial}{\partial t}|\chi\_f^-(t)\rangle = H\_f|\chi\_f^-(t)\rangle = \frac{k^2}{2}|\chi\_f^-(t)\rangle. \tag{8}$$

方程（8）的解是Volkov态[\[37\]](#page-9-0)：

$$\chi\_{\vec{k}}^{(V)-}(\vec{r},t) = \frac{\exp(i\vec{k}\cdot\vec{r})}{(2\pi)^{3/2}} \ e^{-i\epsilon t} \exp[i\,D^{-}(\vec{k},\vec{r},t)] \qquad (9)$$

其中Volkov相位为：

$$D^{-}(\vec{k}, \vec{r}, t) = \vec{A}^{-}(t) \cdot \vec{r} - \vec{k} \int\_{+\infty}^{t} dt^{\top} \, \vec{A}^{-}(t^{\top})$$

$$-\frac{1}{2} \int\_{+\infty}^{t} dt^{\top} \, [\vec{A}^{-}(t^{\top})]^{2},\tag{10}$$

这里*A*-<sup>−</sup>(*t*) = − ∫<sub>*t*</sub><sup>+∞</sup> *dt'* *F*-(*t'*)是场的矢势乘以光速。在此SFA（强场近似）中，忽略了原子核势对出射电子连续态的影响，因此激光脉冲结束后动量成为运动常数。众所周知，SFA无法描述中等弱场和低速电子的电离[\[38\]](#page-9-0)，因此只有在强场和中高电子能量情况下才能与含时薛定谔方程（TDSE）解吻合。

# **C. 半经典模型**

SCM（半经典模型）的推导起点是SFA的鞍点近似[\[1,21–23\]](#page-9-0)，即方程（7），其导致到达连续态的跃迁振幅形式为[\[21\]](#page-9-0)：

$$T\_{if}(\vec{k}) = -\sum\_{i=1}^{M} G\left(t\_r^{(i)}, \vec{k}\right) e^{iS\left(t\_r^{(i)}\right)}.\tag{11}$$

其中*M*是到达给定终态动量*k*的经典轨迹数量，*G*(*t*<sub>*r*</sub><sup>(*i*)</sup>,*k*)是电离振幅：

$$G\left(t\_r^{(i)},\vec{k}\right) = \frac{\pi}{2\sqrt{\tilde{I}\_p} \left|F\left(t\_r^{(i)}\right)\right|} \exp\left[-\frac{(2\tilde{I}\_p)^{3/2}}{3\left|F\left(t\_r^{(i)}\right)\right|}\right].\tag{12}$$

其中˜*I*<sub>*p*</sub> = *I*<sub>*p*</sub> + *k*<sup>2</sup><sub>ρ</sub>/2。类似表达式已从半经典ADK理论导出[\[39,40\]](#page-9-0)，其变体在文献中广泛使用（例如[\[22\]](#page-9-0)）。方程（12）在长度规范下推导。方程（11）中，*S*由经典作用量给出[\[37\]](#page-9-0)：

$$S(t) = -\int\_{t}^{\infty} dt' \left[ \frac{[\vec{k} + \vec{A}(t')]^2}{2} + I\_p \right],\tag{13}$$

其中*A*(*t*) = − ∫<sub>−∞</sub><sup>*t*</sup> *dt' F*(*t'*)对于满足∫<sub>−∞</sub><sup>+∞</sup> *F*(*t*) = 0的传播波与*A*-<sup>−</sup>(*t*)一致。从方程（13），沿释放时间为*t*<sub>*r*</sub><sup>(*i*)</sup>的电子轨迹的半经典作用量（忽略常数项）为：

$$S(t\_r^{(i)}) = \frac{k^2}{2}t\_r^{(i)} - \vec{k} \cdot \vec{\alpha}(t\_r^{(i)}) - \frac{\beta(t)}{2} + \tilde{I}\_p t\_r^{(i)},\qquad(14)$$

其中：

$$\vec{\alpha}(t) = \int\_{-\infty}^{t} dt' \vec{A}(t') \tag{15}$$

<span id="page-3-0"></span>是经典电子的抖动振幅，而：

$$\beta(t) = \int\_{-\infty}^{t} dt' A^2(t') \tag{16}$$

与经典有质动力能相关。

轨迹*i*的释放时间*t*<sub>*r*</sub><sup>(*i*)</sup>由鞍点方程确定[\[41–43\]](#page-9-0)：

$$\left. \frac{\partial S(t')}{\partial t'} \right|\_{t'=t\_r^{(i)}} = \frac{\left[\vec{k} + \vec{A}\left(t\_r^{(i)}\right)\right]^2}{2} + I\_p = 0 \,, \qquad (17)$$

由于*I*<sub>*p*</sub> > 0，该方程给出复数释放时间*t*<sub>*r*</sub><sup>(*i*)</sup>。在SCM中，我们通过设*I*<sub>*p*</sub> = 0和*k*<sub>ρ</sub> = 0将其近似为实数：

$$\left(k\_z + A\left(t\_r^{(i)}\right) = 0\right) \tag{18}$$

来自不同释放时间*t*<sub>*r*</sub><sup>(*i*)</sup>（*i* = 1,2,...）的经典轨迹若满足到达相同终态动量*k*的条件[方程（18）]，则会产生半经典干涉。

为简化起见，我们考虑平顶脉冲，其中*f*(*t*) = *F*<sup>0</sup>位于脉冲中心区域，并在起始和结束处绝热开关。对于无限长双色脉冲的特殊情况：

$$\ddot{F}(t) = F\_0 \left[ \cos(\omega t) + \cos(2\omega t + \varphi) \right] \hat{z},\tag{19}$$

矢势、抖动振幅[方程（15）]和有质动力能项[方程（16）]具有解析形式：

$$\vec{A}(t) = -\frac{F\_0}{\omega} \left[ \sin(\omega t) + \frac{1}{2} \sin(2\omega t + \varphi) \right] \hat{z},\tag{20a}$$

$$\vec{\alpha}(t) = \frac{F\_0}{\omega^2} \left[ \cos(\omega t) + \frac{1}{4} \cos(2\omega t + \varphi) \right] \hat{z},\tag{20b}$$

$$\beta(t) = \frac{F\_0^2}{\omega^2} \left[ -\frac{t}{2} - \frac{2\omega t + \varphi}{16\omega} + \frac{1}{4\omega}\sin(2\omega t) - \frac{1}{2\omega}\sin(\omega t + \varphi) \right]$$

$$+ \frac{1}{32\omega}\sin[2(2\omega t + \varphi)] + \frac{1}{6\omega}\sin(3\omega t + \varphi) \Big]. \text{ (20c)}$$

释放时间为*t*<sub>*r*</sub><sup>(*i*)</sup>的电子轨迹在时间*t*的动能可通过速度计算：

$$\dot{z}\left(t\_r^{(i)},t\right) = A(t) - A\left(t\_r^{(i)}\right). \tag{21}$$

双色平顶脉冲的周期平均动能*E*<sub>kin</sub> = ⟨*ż*(*t*<sub>*r*</sub><sup>(*i*)</sup>,*t*)<sup>2</sup>⟩/2可表示为：

$$E\_{\text{kin}} = U\_p + E\_{\text{drift}} \tag{22}$$

其中有质动力能为：

$$U\_p = \langle A(t)^2 \rangle / 2 = U\_p(\omega) + U\_p(2\omega) = \frac{5}{4}\left(\frac{F\_0}{2\omega}\right)^2 \quad (23)$$

漂移能为：

$$\begin{split} E\_{\text{drift}} &= A \left( t\_r^{(i)} \right)^2 / 2 \\ &= \left( F\_0^2 / 2\omega^2 \right) \Big[ \sin \left( \omega t\_r^{(i)} \right) + \frac{1}{2} \sin \left( 2\omega t\_r^{(i)} + \varphi \right) \Big]^2. \end{split} (24)$$

双色脉冲的有质动力能是各颜色有质动力能之和[方程（23）]。对于绝热关闭的多周期脉冲，有质动力贡献消失，*E*<sub>kin</sub> = *E*<sub>drift</sub>。与*U*<sub>p</sub>不同，双色漂移能由于方程（24）中的交叉项而不具有可加性。因此，最大最终动能取决于相对相位*φ*：最高值出现在*φ* = (*j* + 1/2)*π*时，最低值出现在*φ* = *jπ*时（*j*为整数）。最大漂移能为(9/2)(*F*<sub>0</sub><sup>2</sup>/4*ω*<sup>2</sup>) = (18/5)*U*<sub>p</sub>，显著超过有质动力能。

在SCM中，发射电子在时间*t*<sub>*r*</sub><sup>(*i*)</sup>的轨迹可直接从方程（21）导出：

$$z(t\_r^{(i)}, t) = \alpha(t) - \alpha\left(t\_r^{(i)}\right) - A\left(t\_r^{(i)}\right)\left(t - t\_r^{(i)}\right), \qquad (25)$$

其中初始条件为*z*(*t*<sub>*r*</sub><sup>(*i*)</sup>,*t*<sub>*r*</sub><sup>(*i*)</sup>) = 0，即电子释放时位于原点。基于原子核处初速度为零的假设。通常，在第j个光周期内存在两个满足方程(18)的释放时间值，即所谓的早期释放时间t(j,1)^r和晚期释放时间t(j,2)^r[见图1(a)和1(b)]。对应的电子轨迹z(t(1,1)^r,t)与z(t(1,2)^r,t)在强场近似下相互平行[图1(c)和1(d)]。值得注意的是，对于相位差φ=π/2的双色脉冲，存在一个终态动量区间[图4(b)灰色区域]会出现3或4个释放时间对应同一终态动量的情况，但由于这些区域电场强度（即电离振幅）通常较小，其发射概率远低于只有两条轨迹贡献的动量区域。单色脉冲的最大电离发生在零终态动量处[2,3,14]（即阈值附近），而双色脉冲[φ=π/2时的图1(b)]因电场极值与矢势零点不重合，使得最大电离位置发生偏移。这种非单色场的特性有助于增强路径干涉的可见度。

# 三、半经典模型的验证研究

为检验SCM模型的预测能力，我们将其结果与严格数值求解的含时薛定谔方程(TDSE)以及作为SCM理论基础的含时畸变波强场近似(SFA)[方程(7)]进行对比。通过这种对比可以评估：1) 稳相近似[方程(11)]；2) 忽略发射时间虚部[方程(18)]这两个将SFA简化为SCM的关键近似的影响。同时也能考察SCM忽略的电子再散射效应和库仑势对电离电子动力学的作用。

我们采用由N周期平台段和m周期正弦平缓上升/下降沿组成的有限脉冲包络函数进行模型比较：

$$f(t) = F\_0 \begin{cases} 
\sin^2\left(\frac{\omega}{4m}t\right) & 0 \le t < \frac{2m\pi}{\omega},\\ 
1 & \frac{2m\pi}{\omega} \le t < \pi - \frac{2m\pi}{\omega},\\ 
\sin^2\left[\frac{\omega}{4m}(\pi - t)\right] & \pi - \frac{2m\pi}{\omega} \le t \le \pi, 
\end{cases} \tag{26}$$

计算中取m=2。这种选择确保当总脉冲持续时间是激光周期的整数倍时，平台区的矢势[方程(20a)]与无限长脉冲情况等效，此时平台区电离时间[通过方程(18)或(17)计算]可由SCM解析解给出。方程(26)定义的包络函数不仅能实现平滑启停，还保证多周期脉冲的周期内干涉图样不受脉冲持续时间影响——因为平台区场强周期性重复且不受包络调制（后者会导致电离振幅变化）。

图2展示了双色场相对相位φ=0和φ=π/2时，SCM、SFA和TDSE计算的双微分动量分布。三种方法都重现了以下核心特征：周期间干涉（类ATI峰）表现为半径k_n=√(2(nω-I_p-U_p))的同心圆环，而周期内干涉则体现为前者的振幅调制，这与单色场情况[2,3,14]类似。在中能段（图2高亮区域）三者符合度最佳。SCM分布受限于方程(18)确定的经典允许能区，而SFA和TDSE分布则超越该限制。例如φ=0时经典能量上限E_cl=2.7U_p≈1.46（k_cl≈1.71），φ=π/2时E_cl=18U_p/5=1.95（k_cl=1.97）。图2中SCM的纵向动量k_z被约束在此范围内，而量子处理的SFA和TDSE则不受此限，这是忽略释放时间鞍点值虚部[方程(17)-(18)]导致的，进而造成周期内干涉图样的能量（动量）偏移。

具体而言，在φ=π/2的背向能谱（对应图2负动量区域）中，等间距周期间（或多光子）干涉峰的调制包络存在相对偏移（见图3）。相比SCM，SFA使高能包络向更高能方向偏移（因其未采用方程(18)近似），而TDSE结果因自由电子与核的库仑作用及基态能级的AC斯塔克位移，呈现系统性低能偏移。总体而言，SCM在定性层面上出色地复现了宽能区内复杂干涉条纹的结构特征。

# 四、半经典干涉图样解析

SCM的核心优势在于能解析处理双色场电子能谱中的周期内/间干涉。我们重点分析每个光周期仅两条轨迹干涉的区域（图1）。此处总干涉方程[\(11\)](#page-2-0)中环形轨迹的总数*M*=2*N*，其中*N*为参与的周期数。对

<span id="page-5-0"></span>![](_page_5_Figure_1.jpeg)

图3.（彩色在线）相对相位*ϕ*=*π/*2时，沿偏振轴"后向"（10◦开角）的光电子能量分布。(a)含时薛定谔方程(TDSE)结果，(b)半经典模型(SCM)结果，(c)强场近似(SFA)结果。脉冲参数与图[2](#page-4-0)相同。灰色虚线：周期间干涉包络线。连接(a)(b)(c)子图的粉色点划线展示了三种方法间包络线的偏移现象。

干涉轨迹[方程[\(11\)](#page-2-0)]的和现在可分解为同周期内两个释放时刻对应的轨迹与不同周期释放时刻对应的轨迹[\[2\]](#page-8-0)：

$$\begin{split} T\_{if}(\vec{k}) &= -\sum\_{i=1}^{2N} G\left(t\_r^{(i)}, \vec{k}\right) e^{iS(t\_r^{(i)})} \\ &= -\sum\_{j=1}^{N} \sum\_{a=1}^{2} G\left(t\_r^{(j,a)}, \vec{k}\right) e^{iS(t\_r^{(j,a)})} \\ &= -\sum\_{j=1}^{N} e^{i\vec{S}\_j} \left[ \left[ G\left(t\_r^{(j,1)}, \vec{k}\right) - G\left(t\_r^{(j,2)}, \vec{k}\right) \right] e^{i\frac{\Delta S\_j}{2}} \right] \\ &\quad + 2G\left(t\_r^{(j,2)}, \vec{k}\right) \cos\left(\frac{\Delta S\_j}{2}\right) \bigg], \end{split} \tag{27}$$

其中*S*¯ *<sup>j</sup>* = [*S*(*t* (*j,*1) *<sup>r</sup>* ) <sup>+</sup> *S*(*t* (*j,*2) *<sup>r</sup>* )]*/*2表示第*j*个周期内两条释放轨迹的平均作用量，*ΔS<sub>j</sub>* = *S*(*t* (*j,*1) *<sup>r</sup>* ) <sup>−</sup> *S*(*t* (*j,*2) *<sup>r</sup>* )为同周期内两个释放时刻*t* (*j,*1) *<sup>r</sup>* 与*t* (*j,*2) *<sup>r</sup>* 间的累积作用量差。为简化起见忽略初始态耗尽，方程(27)中的电离振幅*G*(*t* (*j,α*) *<sup>r</sup> ,k*)与光周期（或时间元胞）无关，可省略*t* (*j,α*) *<sup>r</sup>* 的上标*j*。平均作用量随周期数*j*线性变化：

$$
\bar{\mathcal{S}}\_j = \mathcal{S}\_0 + j\tilde{\mathcal{S}},\tag{28}
$$

其中*S*<sub>0</sub>为取方程(27)绝对值时会抵消的常数，*S̃* = (2*π/ω*)(*E* + *U<sub>p</sub>* + *I<sub>p</sub>*)。而作用量差*ΔS<sub>j</sub>*是与周期数*j*无关的常数*ΔS*。

过渡振幅方程(27)可表示为：

$$\begin{split} T\_{if}(\vec{k}) &= -2 \left[ \frac{G\left(t\_r^{(1)}, \vec{k}\right) + G\left(t\_r^{(2)}, \vec{k}\right)}{2} \cos\left(\frac{\Delta S}{2}\right) \right. \\ &\left. + i \frac{G\left(t\_r^{(1)}, \vec{k}\right) - G\left(t\_r^{(2)}, \vec{k}\right)}{2} \sin\left(\frac{\Delta S}{2}\right) \right] e^{iS\_0} \sum\_{j=1}^{N} e^{ij\vec{S}} . \end{split} \tag{29}$$

因此，初始态到末态动量*k*的跃迁概率方程[\(6\)](#page-2-0)可写作：

$$\begin{split} \frac{d\bar{P}}{d\bar{k}} \\ &= 4\Gamma(\bar{k}) \underbrace{\left| \cos\left(\frac{\Delta S}{2}\right) + i \frac{G\left(t\_r^{(1)}, \bar{k}\right) - G\left(t\_r^{(2)}, \bar{k}\right)}{G\left(t\_r^{(1)}, \bar{k}\right) + G\left(t\_r^{(2)}, \bar{k}\right)} \sin\left(\frac{\Delta S}{2}\right) \right|^2}\_{F(\bar{k})} \\ &\times \underbrace{\left[ \frac{\sin(N\tilde{S}/2)}{\sin(\tilde{S}/2)} \right]^2}\_{B(k)}, \end{split} \tag{30}$$

其中Γ(*k*) = |(*G*(*t*<sub>r</sub><sup>(1)</sup>,*k*) + *G*(*t*<sub>r</sub><sup>(2)</sup>,*k*))/2|<sup>2</sup>。当周期数趋向无穷(*N*→∞)时，描述周期间干涉的因子*B*(*k*)：

$$B(k) = \left[\frac{\sin(N\tilde{S}/2)}{\sin(\tilde{S}/2)}\right]^2 \to \sum\_n \delta(E - \varepsilon\_n),\qquad(31)$$

其中*ε<sub>n</sub>* = *nω* − *I<sub>p</sub>* − *U<sub>p</sub>*，给出多光子谱，有限脉宽下谱线展宽为*ΔE* = *ω/N*。因子*F*(*k*)描述周期间干涉。方程(30)在结构上等价于晶体衍射强度表达式：*F*(*k*)代表元胞内部结构引起的干涉调制（形状因子），而*B*(*k*)产生源于晶体周期性的布拉格峰。因此可将*B*(*k*)视为时域中*N*个狭缝的干涉，*F*(*k*)为单狭缝衍射因子。值得将双色场方程(30)与单色场对应表达式比较。当两色场相对相位*ϕ*=*π/*2时，有*G*(*t*<sub>r</sub><sup>(1)</sup>,*k*) = *G*(*t*<sub>r</sub><sup>(2)</sup>,*k*)，此时*F*(*k*) = cos²(*ΔS*/2)，与单色场的周期间干涉因子相同[\[2,3,14\]](#page-9-0)。但对于其他相位*ϕ*≠(*j*+1/2)*π*，*F*(*k*)无零点且产生对比度较低的干涉图样。相比单色场，双色场的相对相位成为干涉过程中时间狭缝的新调控参数。速度规范下可导出类似表达式，虽然前置因子不同且SCM规范不変性不成立，但因结构因子*F*(*k*)和*B*(*k*)不变，干涉图样保持相同，故干涉条纹具有规范不変性。

周期间干涉源于激光脉冲半周期内(*Δt* < *π/ω*)释放的经典轨迹对(*t*<sub>r</sub><sup>(j,1)</sup>−*t*<sub>r</sub><sup>(j,2)</sup>)的叠加，这为NIR脉冲提供了1 fs量级电子波包发射的时间分辨能力。可观测时间狭缝*Δt*的宽度敏感依赖于末态纵向动量*k<sub>z</sub>*和相对相位*ϕ*（图4）。当电场较弱或存在多于两个释放时间解时，这些动量区域的电离概率会被指数压制而可忽略。同样，当某个电离事件占绝对主导时，

![](_page_6_Figure_4.jpeg)

图4.（彩色在线）(a)SCM模型中时间狭缝*Δt*（两条干涉电子轨迹释放时间差）随纵向动量*k<sub>z</sub>*和双色脉冲相对相位*ϕ*的变化。白色区域表示无波包对能到达的动量值。(b)*ϕ*=*π/*2时，双色场（红色）与单色场（蓝色）中时间狭缝*Δt*与纵向动量*k<sub>z</sub>*的关系。单色脉冲的峰值场强调整为*F*<sup>0</sup> = 0.106以匹配双色脉冲的场强。基频为*ω* = 0.057，双色脉冲的峰值电场强度为*F*<sup>0</sup> = 0.075。我们筛选了电离概率相近的轨迹对（满足1/2 < |*F*(*t*(*j*,1)*<sup>r</sup>*)/*F*(*t*(*j*,2)*<sup>r</sup>*)| < 2），此时干涉效应可忽略不计。因此，只有当方程[18](#page-3-0)存在两个电离概率相近的解时，时间狭缝*t*才具有可分辨性[图4(a)]。

当相位*ϕ* = (*j* + 1/2)*π*时，纵向动量*kz*向高能区的最大扩展与最强的前后不对称性以及最宽的可观测时间窗口（从~1 fs下至约50 as）相吻合。时间窗口下限由弱场下的电离抑制决定，而上限（1 fs）则要求终态动量足够大，使得阈值附近的强库仑畸变（SCM未考虑）影响可忽略。图4(a)在*ϕ* = *π*/2处的截面分布展示了*kz*与*t*的映射关系[图4(b)]。作为对比，我们同时展示了同频率（*ω* = 0.057）和匹配强度（*F*<sup>0</sup> = 0.106）的单色激光场情形。灰色阴影区标示库仑势影响显著的动量范围，虚线标记的<50 as延迟因弱场电离抑制而无法有效探测。双色脉冲的映射函数*kz*(*t*)斜率明显陡于单色情形，表明其具备更优的时间分辨能力。

我们计算了具有平顶包络（即*f*(*t*) = *F*<sup>0</sup> = 0.075）、基频*ω* = 0.057、持续两光学周期的双色激光脉冲[式(1)](#page-1-0)沿偏振轴的光电子能谱。利用式[6](#page-2-0)与式[11](#page-2-0)的SCM模拟显示：当*ϕ* = 0时[图5(a)]，能谱呈现前后对称性[38](#page-9-0)；而最大不对称性出现在半整数倍*π*相位（*ϕ* = (*j* + 1/2)*π*）时[图5(b)(c)]，此时电子主要向后发射。所有能谱均清晰呈现源于式[30](#page-5-0)中周期间干涉因子*B*(*k*)的多光子峰结构——本例中由于仅两光学周期的相干叠加，该因子退化为双缝杨氏干涉表达式*B*(*k*) = 4 cos²[*π/ω*(*E* + *Up* + *Ip*)]。此峰结构又受到周内因子*F*(*k*-)的调制，后者反映单周期贡献。

当*ϕ* = *π*/2时，因*F*(*k*-) = cos²(*S*/2)使得周内干涉极小值为零；而*ϕ* = 0时极小值保持有限[式30](#page-5-0)，这解释了双色实验中*ϕ* = 0时周内干涉可见度降低的现象[32,44](#page-9-0)。对比度随*ϕ*的变化同样体现在角积分能谱中（图6），但当前后半球分布叠加时差异减弱。

图7展示了平顶脉冲区域中，随着周期数*N*增加，双微分动量分布（纵向动量*kz*与横向动量*k*<sup>⊥</sup>）干涉条纹的演化过程：*N*=1时仅出现周内干涉条纹*F*(*k*)；*N*=2,4时则逐渐显现描述周期间干涉的布拉格因子*B*(*k*)产生的精细结构。所有脉冲长度下，*ϕ*=0的图案保持前后对称，而*ϕ*=*π*/2时分布"质心"左移——该现象在TDSE谱[图2(e)(f)](#page-4-0)中亦可观察到（虽不如SCM明显）。实验上常仅记录纵向动量分布*P*(*kz*)[44](#page-9-0)。SCM预测的*P*(*kz*)随*ϕ*变化规律（图8）揭示了周期间与周内干涉条纹的关键差异：周期间条纹与*ϕ*无关，而周内条纹呈现显著正弦调制[图8(a)]。重要发现是：当能量分辨率不足导致多光子峰无法分辨时，周内干涉调制仍清晰可辨，这对阿秒测量具有特殊价值。

![](_page_6_Figure_9.jpeg)  
图5.（彩色在线）双周期（实线）与单周期脉冲（周内干涉，虚线）沿偏振轴的光电子能谱：(a)前后对称脉冲*ϕ*=0；(b)(c)不对称脉冲*ϕ*=*π*/2的前向与后向分布。*ϕ*=*π*/2时(b)的周内干涉条纹对比度较(a)*ϕ*=0更锐利。激光参数*F*<sup>0</sup>=0.075，*ω*=0.057。

![](_page_7_Figure_5.jpeg)  
图6.（彩色在线）角积分的SCM光电子分布：(a)*ϕ*=0与(b)*ϕ*=*π*/2的双周期（实线）和单周期（虚线）脉冲。相较角分辨谱（图5），周内干涉条纹对比度降低。激光参数同上。

![](_page_7_Figure_8.jpeg)  
图7.（彩色在线）SCM双微分动量分布随脉冲长度（周期数*N*）的变化：左列(a)(b)(c)对应*ϕ*=0，右列(d)(e)(f)对应*ϕ*=*π*/2。首行(a)(d)为单周期周内干涉，中行(b)(e)为双周期，末行(c)(f)为四周期。*ϕ*=*π*/2的周内条纹对比度始终优于*ϕ*=0。激光参数同上。

<span id="page-8-0"></span>![](_page_8_Figure_1.jpeg)  
图8.（彩色在线）SCM纵向动量分布*P*(*kz*)随*ϕ*的变化：(a)完整分布显示周期间（*ϕ*无关）与周内（正弦调制）干涉；(b)低能区放大显示周内条纹相位敏感性。该特性在能谱仪分辨率受限时仍可保持。*(*kz*)沿偏振轴方向随相对相位*ϕ*的变化关系。(a) 单周期脉冲的纯周期内干涉图样，(b) 双周期脉冲，(c) 四周期脉冲。激光参数为*F*<sup>0</sup> = 0.075，*ω* = 0.057。

对于无法分辨电离过程中多光子特征的低分辨率实验，仍可通过更宽的周期内干涉图样获得与亚周期光发射事件间释放时间间隔相关的阿秒时间分辨率。

在速度规范下，电离振幅*G*(*t*(*i*) *<sup>r</sup> ,k*-)的指数因子与长度规范相同[见公式(12)]，但前置系数不同。与预期一致，半经典模型（SCM）与所有强场近似一样不具有规范不变性。例如Bauer等人研究表明，对于基态为奇宇称的负离子电离，两种规范的预测存在本质差异[45]——角分辨能谱包络中，一种规范的凹陷对应另一种规范的凸起。但氢原子基态为偶宇称时情况不同，两种规范下的ATI峰位完全一致。由于长度规范和速度规范下的跃迁振幅均满足公式(11)的形式，动量分布在周期内与周期间干涉因子的乘积分解形式在速度规范中依然成立。我们通过速度规范下的SCM数值计算（未展示）验证了这一结论。

# **五、结论**

我们通过半经典理论分析了高强*ω*-2*ω*双色激光脉冲与原子相互作用产生的直接电离谱中的干涉效应。SCM解析方法成功解释了TDSE在强场近似下的精确解以及实验[32]中观测到的复杂衍射图样，这些干涉条纹源于周期内与周期间路径干涉的叠加。

周期内干涉来自同一光学周期内释放的电子波包相干叠加，而周期间干涉对应光电子谱中著名的多光子峰结构——源自不同光学周期周期性释放的波包叠加。当双色光相对相位*ϕ* = *π/*2时，周期内干涉调制最为显著：SCM与强场近似下干涉图样对比度完美，TDSE结果中对比度良好但不完美。我们证明对于平顶脉冲，周期内调制与激光场包含的总光学周期数无关。这意味着即使对于包含多个光学周期的长双色脉冲，仍可轻松观测到波包在*t* ≈ 100阿秒时间间隔内释放产生的亚周期干涉。此外，这些周期内干涉图样具有较强鲁棒性，在低分辨率光电子谱中仍应可见。

### **致谢**

本研究获CONICET PIP11220090100552、奥地利-阿根廷合作项目AU/12/02、阿根廷ANPCyT PICT2010-1084、布宜诺斯艾利斯大学UBACyT691资助，并得到奥地利科学基金FWF P23359-N16、P25615-N27、P21463-N22及SFB-049 NEXTLITE部分支持。计算结果部分使用维也纳科学集群(VSC)完成。

[参考文献列表保持原文格式不变]以下是您提供的Markdown文献列表的简体中文翻译，严格保留原始格式与图片链接：

- [10] C. M. Maharjan, A. S. Alnaser, I. Litvinyuk, P. Ranitovic, 和 C. L. Cocke, [J. Phys. B](http://dx.doi.org/10.1088/0953-4075/39/8/013) **[39](http://dx.doi.org/10.1088/0953-4075/39/8/013)**, [1955](http://dx.doi.org/10.1088/0953-4075/39/8/013) [\(2006\)](http://dx.doi.org/10.1088/0953-4075/39/8/013).
- [11] T. Marchenko, H. G. Muller, K. J. Schafer, 和 M. J. J. Vrakking, [J. Phys. B](http://dx.doi.org/10.1088/0953-4075/43/9/095601) **[43](http://dx.doi.org/10.1088/0953-4075/43/9/095601)**, [095601](http://dx.doi.org/10.1088/0953-4075/43/9/095601) [\(2010\)](http://dx.doi.org/10.1088/0953-4075/43/9/095601).
- [12] [B. Bergues, Z. Ansari, D. Hanstorp, 和 I. Y. Kiyan,](http://dx.doi.org/10.1103/PhysRevA.75.063415) Phys. Rev. A **[75](http://dx.doi.org/10.1103/PhysRevA.75.063415)**, [063415](http://dx.doi.org/10.1103/PhysRevA.75.063415) [\(2007\)](http://dx.doi.org/10.1103/PhysRevA.75.063415).
- [13] S. Bivona, G. Bonanno, R. Burlon, D. Gurrera, 和 C. Leone, [Phys. Rev. A](http://dx.doi.org/10.1103/PhysRevA.77.051404) **[77](http://dx.doi.org/10.1103/PhysRevA.77.051404)**, [051404](http://dx.doi.org/10.1103/PhysRevA.77.051404) [\(2008\)](http://dx.doi.org/10.1103/PhysRevA.77.051404); S. Bivona, G. Bonanno, R. Burlon, 和 C. Leone, *[ibid.](http://dx.doi.org/10.1103/PhysRevA.79.035403)* **[79](http://dx.doi.org/10.1103/PhysRevA.79.035403)**, [035403](http://dx.doi.org/10.1103/PhysRevA.79.035403) [\(2009\)](http://dx.doi.org/10.1103/PhysRevA.79.035403).
- [14] [D. G. Arbo, K. L. Ishikawa, E. Persson, 和 J. Burgd](http://dx.doi.org/10.1016/j.nimb.2011.10.030) ´ orfer, ¨ Nucl. Instrum. Methods B **[279](http://dx.doi.org/10.1016/j.nimb.2011.10.030)**, [24](http://dx.doi.org/10.1016/j.nimb.2011.10.030) [\(2012\)](http://dx.doi.org/10.1016/j.nimb.2011.10.030).
- [15] 参见 H. B. van Linden van den Heuvell 和 H. G. Muller 在*Multiphoton Processes*中的论述（由 S. J. Smith 和 P. L. Knight 编辑，剑桥大学出版社，1988年，第25-34页），他们将这种经典描述命名为"Simpleman理论"。
- [16] V. Keldysh, Zh. Eksp. Teor. Fiz. **47**, 1945 (1964) ,[Sov. Phys. JETP **20**, 1307 (1965)].
- [17] F. H. M. Faisal, [J. Phys. B](http://dx.doi.org/10.1088/0022-3700/6/4/011) **[6](http://dx.doi.org/10.1088/0022-3700/6/4/011)**, [L89](http://dx.doi.org/10.1088/0022-3700/6/4/011) [\(1973\)](http://dx.doi.org/10.1088/0022-3700/6/4/011).
- [18] H. R. Reiss, [Phys. Rev. A](http://dx.doi.org/10.1103/PhysRevA.22.1786) **[22](http://dx.doi.org/10.1103/PhysRevA.22.1786)**, [1786](http://dx.doi.org/10.1103/PhysRevA.22.1786) [\(1980\)](http://dx.doi.org/10.1103/PhysRevA.22.1786).
- [19] [P. A. Macri, J. E. Miraglia, 和 M. S. Gravielle,](http://dx.doi.org/10.1364/JOSAB.20.001801) J. Opt. Soc. Am. B **[20](http://dx.doi.org/10.1364/JOSAB.20.001801)**, [1801](http://dx.doi.org/10.1364/JOSAB.20.001801) [\(2003\)](http://dx.doi.org/10.1364/JOSAB.20.001801).
- [20] V. D. Rodriguez, E. Cormier, 和 R. Gayet, [Phys. Rev. A](http://dx.doi.org/10.1103/PhysRevA.69.053402) **[69](http://dx.doi.org/10.1103/PhysRevA.69.053402)**, [053402](http://dx.doi.org/10.1103/PhysRevA.69.053402) [\(2004\)](http://dx.doi.org/10.1103/PhysRevA.69.053402); V. D. Rodriguez, P. A. Macri, 和 D. G. Arbo, ´ [Nucl. Instrum. Methods B](http://dx.doi.org/10.1016/j.nimb.2008.10.066) **[267](http://dx.doi.org/10.1016/j.nimb.2008.10.066)**, [334](http://dx.doi.org/10.1016/j.nimb.2008.10.066) [\(2009\)](http://dx.doi.org/10.1016/j.nimb.2008.10.066).
- [21] M. Lewenstein, K. C. Kulander, K. J. Schafer, 和 P. H. Bucksbaum, [Phys. Rev. A](http://dx.doi.org/10.1103/PhysRevA.51.1495) **[51](http://dx.doi.org/10.1103/PhysRevA.51.1495)**, [1495](http://dx.doi.org/10.1103/PhysRevA.51.1495) [\(1995\)](http://dx.doi.org/10.1103/PhysRevA.51.1495); M. Lewenstein, Ph. Balcou, M. Yu. Ivanov, A. L'Huillier, 和 P. B. Corkum, *[ibid.](http://dx.doi.org/10.1103/PhysRevA.49.2117)* **[49](http://dx.doi.org/10.1103/PhysRevA.49.2117)**, [2117](http://dx.doi.org/10.1103/PhysRevA.49.2117) [\(1994\)](http://dx.doi.org/10.1103/PhysRevA.49.2117).
- [22] C. C. Chirila 和 R. M. Potvliege, [Phys. Rev. A](http://dx.doi.org/10.1103/PhysRevA.71.021402) **[71](http://dx.doi.org/10.1103/PhysRevA.71.021402)**, [021402\(](http://dx.doi.org/10.1103/PhysRevA.71.021402)R) [\(2005\)](http://dx.doi.org/10.1103/PhysRevA.71.021402).
- [23] [M. Ivanov, P. B. Corkum, T. Zuo, 和 A. Bandrauk,](http://dx.doi.org/10.1103/PhysRevLett.74.2933) Phys. Rev. Lett. **[74](http://dx.doi.org/10.1103/PhysRevLett.74.2933)**, [2933](http://dx.doi.org/10.1103/PhysRevLett.74.2933) [\(1995\)](http://dx.doi.org/10.1103/PhysRevLett.74.2933).
- [24] A. K. Kazansky 和 N. M. Kabachnik, [J. Phys. B](http://dx.doi.org/10.1088/0953-4075/43/3/035601) **[43](http://dx.doi.org/10.1088/0953-4075/43/3/035601)**, [035601](http://dx.doi.org/10.1088/0953-4075/43/3/035601) [\(2010\)](http://dx.doi.org/10.1088/0953-4075/43/3/035601).
- [25] F. Ehlotzky, [Phys. Rep.](http://dx.doi.org/10.1016/S0370-1573(00)00100-9) **[345](http://dx.doi.org/10.1016/S0370-1573(00)00100-9)**, [175](http://dx.doi.org/10.1016/S0370-1573(00)00100-9) [\(2001\)](http://dx.doi.org/10.1016/S0370-1573(00)00100-9).
- [26] D. W. Schumacher, F. Weihe, H. G. Muller, 和 P. H. Bucksbaum, [Phys. Rev. Lett.](http://dx.doi.org/10.1103/PhysRevLett.73.1344) **[73](http://dx.doi.org/10.1103/PhysRevLett.73.1344)**, [1344](http://dx.doi.org/10.1103/PhysRevLett.73.1344) [\(1994\)](http://dx.doi.org/10.1103/PhysRevLett.73.1344).
- [27] H. G. Muller, P. H. Bucksbaum, D. W. Schumacher, 和 A. Zavriyev, [J. Phys. B](http://dx.doi.org/10.1088/0953-4075/23/16/018) **[23](http://dx.doi.org/10.1088/0953-4075/23/16/018)**, [2761](http://dx.doi.org/10.1088/0953-4075/23/16/018) [\(1990\)](http://dx.doi.org/10.1088/0953-4075/23/16/018).
- [28] H. Ohmura, T. Nakanaga, 和 M. Tachiya, [Phys. Rev. Lett.](http://dx.doi.org/10.1103/PhysRevLett.92.113002) **[92](http://dx.doi.org/10.1103/PhysRevLett.92.113002)**, [113002](http://dx.doi.org/10.1103/PhysRevLett.92.113002) [\(2004\)](http://dx.doi.org/10.1103/PhysRevLett.92.113002).
- [29] M. Fifrig, A. Cionga, 和 F. Ehlotzky, [Eur. Phys. J. D](http://dx.doi.org/10.1140/epjd/e2003-00097-5) **[23](http://dx.doi.org/10.1140/epjd/e2003-00097-5)**, [333](http://dx.doi.org/10.1140/epjd/e2003-00097-5) [\(2003\)](http://dx.doi.org/10.1140/epjd/e2003-00097-5).
- [30] A. Cionga, M. Fifrig, 和 F. Ehlotzky, [J. Mod. Opt.](http://dx.doi.org/10.1080/09500340308233554) **[50](http://dx.doi.org/10.1080/09500340308233554)**, [615](http://dx.doi.org/10.1080/09500340308233554) [\(2003\)](http://dx.doi.org/10.1080/09500340308233554).
- [31] S. De, I. Znakovskaya, D. Ray, F. Anis, N. G. Johnson, I. A. Bocharova, M. Magrakvelidze, B. D. Esry, C. L. Cocke, I. V. Litvinyuk, 和 M. F. Kling, [Phys. Rev. Lett.](http://dx.doi.org/10.1103/PhysRevLett.103.153002) **[103](http://dx.doi.org/10.1103/PhysRevLett.103.153002)**, [153002](http://dx.doi.org/10.1103/PhysRevLett.103.153002) [\(2009\)](http://dx.doi.org/10.1103/PhysRevLett.103.153002).

（注：第[15]条中书名《Multiphoton Processes》按学术惯例保留英文原名；所有DOI链接、期刊名称缩写及文献编号均严格保留原始格式）