# Discuz Sphinx

这是一个供 Discuz Sphinx 全文搜索功能使用的 Docker 镜像，封装好了全部索引配置，开箱即用

正在调试中，可能会出现不兼容旧版本的更新，请暂时不要用于开发以外的用途。

推荐的 docker-compose 配置如下：

```yaml
  sphinx:
    restart: always
    image: mycard/discuz-sphinx
    ulimits:
      nproc: 65535
      nofile:
         soft: 65535
         hard: 65535
      memlock:
        soft: -1
        hard: -1
    volumes:
      - /etc/localtime:/etc/localtime
    environment:
      sql_host:
      sql_user:
      sql_pass:
      sql_db:
```

在 Discuz 后台 全局 - 搜索设置 - Sphinx 全文检索设置：
是否开启: 是
主机名: sphinx
端口: 9312
最大时间: 10000
最大数目: 10000
