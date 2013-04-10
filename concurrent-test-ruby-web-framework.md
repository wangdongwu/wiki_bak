> **并发测试** 属于 **压力测试** 的一项基本指标。  

###测试环境  

硬件：华硕K43SJ笔记本，i5 6核 2.50GHZ，4G内存  
操作系统：Ubuntu 桌面版 12.04 LTS  
Ruby版本：1.9.3，2.0.0  
Ruby Web框架：Sinatra，Padrino，Goliath，Rails   
HTTP server：Unicorn，Rainbows    
测试工具：Apache ab  

###测试方法   

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

[调试脚本]() 

###并发测试结果  

####1. Sinatra + Unicorn

Sinatra配置：
```ruby
get '/' do
  "hello world! it's #{Time.now} here!"
end
```
Unicorn配置：
```ruby
worker_processes 5
timeout 30
```

> **5000个请求，50个并发，运行5次，结果如下：**
```
Concurrency Level:      50.0|50.0|50.0|50.0|50.0|
Time taken for tests:   2.815|2.99|3.033|3.055|3.012|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    1776.12|1672.5|1648.48|1636.52|1659.95|
Time per request:       28.151|29.895|30.331|30.553|30.121|
Time per request:       0.563|0.598|0.607|0.611|0.602|
Transfer rate:          509.94|480.19|473.29|469.86|476.59|
```
**均值：**
```
Concurrency Level:      50.00
Time taken for tests:   2.98 seconds  
Complete requests:      5000
Requests per second:    1678.71 [#/sec] (mean)
Time per request:       29.81 [ms] (mean)
Time per request:       0.60 [ms] (mean, across all concurrent requests)
Transfer rate:          481.97  [Kbytes/sec] received
```


> **5000个请求，100个并发，运行5次，结果如下：**
```
Concurrency Level:      100.0|100.0|100.0|100.0|100.0|
Time taken for tests:   2.845|2.981|3.044|3.084|3.093|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    1757.27|1677.23|1642.47|1621.51|1616.77|
Time per request:       56.906|59.622|60.884|61.671|61.852|
Time per request:       0.569|0.596|0.609|0.617|0.619|
Transfer rate:          504.53|481.55|471.57|465.55|464.19|
```
**均值：**
```
Concurrency Level:      100.00
Time taken for tests:   3.01 seconds
Complete requests:      5000.00
Requests per second:    1663.05 [#/sec] (mean)
Time per request:       60.19 [ms] (mean)
Time per request:       0.60 [ms] (mean, across all concurrent requests)
Transfer rate:          477.48 [Kbytes/sec] received
```

> **5000个请求， 100个并发，运行5次，脚本运行失败：**
```
apr_socket_recv: Connection reset by peer (104)
```

####2. Sinatra + Unicorn + Rainbows

Rainbows配置：
```ruby
Rainbows! do
  use :ThreadSpawn  # 开启线程模式
  worker_connections 400
end
```


**ab -n 5000 -c 50 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows** 
```
Concurrency Level:      50
Time taken for tests:   2.544 seconds
Complete requests:      5000
Requests per second:    1965.79 [#/sec] (mean)
Time per request:       25.435 [ms] (mean)
Time per request:       0.509 [ms] (mean, across all concurrent requests)
Transfer rate:          564.40 [Kbytes/sec] received
```

**ab -n 5000 -c 100 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows** 
```
Concurrency Level:      100
Time taken for tests:   2.450 seconds
Complete requests:      5000
Requests per second:    2041.16 [#/sec] (mean)
Time per request:       48.992 [ms] (mean)
Time per request:       0.490 [ms] (mean, across all concurrent requests)
Transfer rate:          586.03 [Kbytes/sec] received
```

**ab -n 5000 -c 150 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows** 
```
Concurrency Level:      150
Time taken for tests:   2.491 seconds
Complete requests:      5000
Requests per second:    2007.35 [#/sec] (mean)
Time per request:       74.725 [ms] (mean)
Time per request:       0.498 [ms] (mean, across all concurrent requests)
Transfer rate:          576.33 [Kbytes/sec] received
```

**ab -n 5000 -c 200 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows**  
```
Concurrency Level:      200
Time taken for tests:   2.498 seconds
Complete requests:      5000
Requests per second:    2001.37 [#/sec] (mean)
Time per request:       99.931 [ms] (mean)
Time per request:       0.500 [ms] (mean, across all concurrent requests)
Transfer rate:          574.61 [Kbytes/sec] received
```

**ab -n 5000 -c 300 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows**
```
Concurrency Level:      300
Time taken for tests:   2.526 seconds
Complete requests:      5000
Requests per second:    1979.46 [#/sec] (mean)
Time per request:       151.556 [ms] (mean)
Time per request:       0.505 [ms] (mean, across all concurrent requests)
Transfer rate:          568.32 [Kbytes/sec] received
```

**ab -n 5000 -c 400 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows**
```
Concurrency Level:      400
Time taken for tests:   3.133 seconds
Complete requests:      5000
Requests per second:    1596.16 [#/sec] (mean)
Time per request:       250.602 [ms] (mean)
Time per request:       0.627 [ms] (mean, across all concurrent requests)
Transfer rate:          458.27 [Kbytes/sec] received
```

**ab -n 5000 -c 500 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows**
```
Concurrency Level:      500
Time taken for tests:   4.453 seconds
Complete requests:      5000
Requests per second:    1122.90 [#/sec] (mean)
Time per request:       445.275 [ms] (mean)
Time per request:       0.891 [ms] (mean, across all concurrent requests)
Transfer rate:          322.40 [Kbytes/sec] received
```

**ab -n 5000 -c 600 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows**
```
Concurrency Level:      600
Time taken for tests:   8.566 seconds
Complete requests:      5000
Requests per second:    583.67 [#/sec] (mean)
Time per request:       1027.973 [ms] (mean)
Time per request:       1.713 [ms] (mean, across all concurrent requests)
Transfer rate:          167.58 [Kbytes/sec] received
```
**ab -n 5000 -c 700 http://0.0.0.0:3001/  -- Sinatra + Unicorn + Rainbows**
`failed`



