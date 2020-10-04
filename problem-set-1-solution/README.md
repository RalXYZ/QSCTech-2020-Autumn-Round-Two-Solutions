# 声明  

### 我没有选择完整解决此问题集，仅凭兴趣解答部分内容  
### 此目录下有我对此问题集某些问题的不完整解答，且目录结构可能不符合规范  
### 如果你对我的不完整解答感兴趣，欢迎你进行阅读  
### 否则，请忽略这个目录下的所有文件，重点关注我对其他两题的解答  

| 表情符号 | 含义 |
| --- | ---|
| ⚠ | 解答不完整 |



***

## 2-1
不一样。因为`sh`指令开了个新的 Shell 进程。



## 2-2
想让 `MY_VALUE` 在不同的 Shell 进程间有相同的值？~~那你直接把它写到配置文件里不就行了~~
显然上面这种方法不优雅。如果你的需求仅仅是在当前 Shell 进程的**子进程**中使用该变量，你只需执行：
```shell
export MY_VALUE
```
该语句把`MY_VALUE`导出到了环境变量中。但，假设父进程消失，或进入一个与父线程无“继承”关系的进程，`MY_VALUE`就不会被读到了。

除了直接赋值外，我们也可以通过语句给变量赋值。比如：
```shell
for movie in Inception Momento; do
    echo "${movie} is one of my favourite movies."
done

echo $movie  # the result is Momento
```



## 2-4
```shell
sudo useradd dino -p `openssl passwd -1 dinoallo` -s /bin/zsh  
# I am using zsh, and I set login shell as zsh for dino
sudoedit /etc/sudoers
# add "user ALL=(ALL) ALL"
```



## 2-6 ⚠
```shell
apt depends xterm
```



## 2-7

| 仓库名 | 支持 | 开源 | 举例 |
| --- | --- | --- | --- |
| Main | 官方 | ✔ | vim |
| Universe | 社区 | ✔ | docker |
| Multiverse | 社区 | ⚠ | |
| Restricted | 官方 | ❌ | nvidia-331       |
| Partner |  | | adobe-flasplugin |
> ...and NVIDIA has been the single worst company we've ever dealt with, so NVIDIA, f**k you!
> -- Linus Torvalds 



## 2-9
```shell
ls -d .*
```



## 2-11
这个目录下较为少见的文件类型是`b`和`c`.
`b`代表块 (block) 设备，`c` 代表字符 (character) 设备。
块设备的访问方式可能是非连续的。若将一段数据存到磁盘上，该数据可能被分割，并存储到硬盘上不连续的位置中，例如SCSI设备`sd`，回环设备`loop`.
字符设备的访问方式应该是流式的，例如虚拟终端`tty`，空设备`null`.