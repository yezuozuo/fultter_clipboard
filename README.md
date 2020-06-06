# flutterapp

A new Flutter application.

自动获取手机端复制的批注，格式化好，然后批量复制或者发送到其他软件上。

问题：
1. 软件需要后台常驻，无法感知到是否复制成功。
2. 
ios退到后台没法拿到剪贴板的信息，paste的实现原理是先通过handoff share到mac上，然后mac存到icloud上，然后手机读的icloud的内容……

用iphone和mac测了一下。

实验一：mac打开，paste退到后台，手机上复制两段文字。
结果：mac上的paste显示两段文字，打开手机端paste，也显示两段文字

实验二：mac关闭，paste退到后台，手机上复制两段文字。
结果：打开手机端paste，显示一段文字
