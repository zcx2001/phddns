# 花生壳docker客户端

当前更新到5.2.0

# 使用方法
## 运行容器，mac地址要替换成自己的
```
docker run -d --name phddns --mac-address 80:0C:E7:81:11:22 zcx2001/phddns:latest
```
## 查看花生壳SN
```
docker exec phddns phddns status
```