> **并发测试** 属于 **[压力测试](https://github.com/NaixSpirit/wiki/blob/master/web-stress-test.md)** 的一项基本指标。  

###测试环境  

硬件：华硕K43SJ笔记本，i5 6核 2.50GHZ，4G内存  
操作系统：Ubuntu 桌面版 12.04 LTS  
Ruby版本：1.9.3  
Python版本：2.7.3
Web框架：Sinatra，Tornado，PHP   
HTTP server：Unicorn，Rainbows，Apache    
测试工具：Apache ab  

-

###测试方法   

**各框架搭建环境**  

各框架均只测试静态页面 **hello, world! 并输出当前系统时间** ，不涉及对数据库进行交互操作。

**Apache ab 命令**  

`ab -n xxx -c yyy http://0.0.0.0:3001/`  
表示 http://0.0.0.0:3001/ 同时处理 xxx 个请求，yyy 个并发。  
保持xxx请求个数不变，yyy并发个数递增式测试。  
每条命令均取 **5** 次平均值保证其准确性。

**主要关注指标**  

每秒事务数（吞吐率）   
Requests per second: xxx \[#/sec] (mean)   

平均事务响应时间  
Time per request: xxx \[ms] (mean)    

每个请求实际运行时间    
Time per request: xxx \[ms] (mean, across all concurrent requests) 

平均每秒网络流量    
Transfer rate: xxx \[Kbytes/sec] received  

**测试脚本**  

[调试脚本]() 

-

###并发测试结果  

Unicorn配置：
```ruby
worker_processes 5
timeout 30
```

-

####1. Sinatra

详细测试结果请见：[Sinatra 并发测试结果](https://github.com/NaixSpirit/wiki/blob/master/testreport/sinatra-test.md)

**最大值**  
> **5000个请求，100个并发，运行5次，均值如下：**
```
Concurrency Level:      100.00
Time taken for tests:   3.01 seconds
Complete requests:      5000.00
Requests per second:    1663.05 [#/sec] (mean)
Time per request:       60.19 [ms] (mean)
Time per request:       0.60 [ms] (mean, across all concurrent requests)
Transfer rate:          477.48 [Kbytes/sec] received
```

> **5000个请求， 150个并发，运行5次，脚本运行失败：**
```
apr_socket_recv: Connection reset by peer (104)
```

####2. Sinatra + Rainbows

Rainbows配置：
```ruby
Rainbows! do
  use :ThreadSpawn  # 开启线程模式
  worker_connections 400
end
```

详细测试结果请见：[Sinatra + Rainbows 并发测试结果](https://github.com/NaixSpirit/wiki/blob/master/testreport/sinatra-rainbows-test.md)

**最大值**  
> **5000个请求， 550个并发，运行5次，均值如下：**
```
Concurrency Level:      550.00
Time taken for tests:   6.18 seconds
Complete requests:      5000.00
Requests per second:    902.85 [#/sec] (mean)
Time per request:       680.26 [ms] (mean)
Time per request:       1.24 [ms] (mean, across all concurrent requests)
Transfer rate:          259.22 [Kbytes/sec] received
```

> **5000个请求， 600个并发，运行5次，脚本运行失败：**
```
apr_poll: The timeout specified has expired (70007)
```


####3. Tornado

详细测试结果请见：[Tornado 并发测试结果](https://github.com/NaixSpirit/wiki/blob/master/testreport/tornado-test.md)

**最大值**  
> **5000个请求， 1000个并发，运行5次，均值如下：**
```
Concurrency Level:      1000.00
Time taken for tests:   2.51 seconds
Complete requests:      5000.00
Requests per second:    2083.02 [#/sec] (mean
Time per request:       501.87 [ms] (mean)
Time per request:       0.50 (mean, across all concurrent requests)
Transfer rate:          484.14 [Kbytes/sec] received
```

> **5000个请求， 1050个并发，运行5次，脚本运行失败：**
```
socket: Too many open files (24)
```

####4. PHP

详细测试结果请见：[PHP 并发测试结果](https://github.com/NaixSpirit/wiki/blob/master/testreport/php-test.md)

**最大值**  
> **5000个请求， 450个并发，运行5次，均值如下：**
```
Concurrency Level:      450.00
Time taken for tests:   11.60 seconds
Complete requests:      5000.00
Requests per second:    635.37 [#/sec] (mean
Time per request:       1043.88 [ms] (mean)
Time per request:       2.32 (mean, across all concurrent requests)
Transfer rate:          159.47 [Kbytes/sec] received
```

> **5000个请求， 500个并发，运行5次，脚本运行失败：**
```
apr_socket_recv: Connection reset by peer (104)
```

-

###总结

通过ab工具对Sinatra，Tornado，PHP三个框架的压力测试，发现Tornado在处理多并发时表现情况最好。  
排序如下:  
1 - Tornado  最高5000个请求， 1000个并发  
2 - Sinatra + Rainbows  最高5000个请求， 550个并发  
3 - PHP  最高5000个请求， 450个并发  
4 - Sinatra  最高5000个请求， 100个并发  

