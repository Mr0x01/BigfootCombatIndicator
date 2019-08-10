# Bigfoot 大脚战斗指示器CombatIndicator(提取版)
之前一直用大脚，后来换了ElvUI，但是仍然习惯大脚自带的战斗指示器，但是发现单独放入CombatIndicator无法正常工作，所以花了一点时间看了看代码，做了个提取版。

![](https://raw.githubusercontent.com/Mr0x01/BigfootCombatIndicator/master/example.png)
---

## **重要**

1.需要ACE3.0，大多数插件包都带，ElvUI已自带。 

2.CombatIndicator是8.0版本(版本号pattern为8xxxx)，CombatIndicator-Classic是怀旧服版本(版本号为11302)

3.版本更迭时需要修改toc里边的版本号，或在游戏选项内勾上“加载过期插件”，理论上只要ACE3能用这个插件就能用，无其他特殊依赖。

---


## 提取过程
CombatIndicator.lua中调用了名为“BigFoot_AddAction”和“BigFoot_CreateAnim”方法

  ```javascript
 BigFoot_CreateAnim("indicator"..CombatIndicator_ca0d0d660e1912c635e4a2af6bc9ff28, CombatIndicator_390231f67fc064f33775aafff8fa9629);

  BigFoot_AddAction(CombatIndicator_04c0600c1b894c6808bccb7243e44859, nil, "SLIDE", 0.1, nil, nil, 20, 0, 0);
  ```
    
但本文件并没有对这两个方法的定义，所以猜测是在大脚核心中。

查看BigFoot核心文件夹，发现名为“BigFootAnim.lua”的文件似乎符合上述函数的特点，打开发现果不其然。将BigFootAnim.lua放入CombatIndicator文件夹，并在toc文件中加入BigFootAnim.lua，去掉toc文件中的对大脚核心的依赖，丢入魔兽世界插件目录，工作正常。

---

## 备注

在压力测试服调试时发现，ElvUI所自带的ACE3库无法被CombatIndicator直接使用，所以精简了一份适配Classic服务器的ACE3库合并进了CombatIndicator，也因此，怀旧服版本的CombatIndicator可以独立运行。