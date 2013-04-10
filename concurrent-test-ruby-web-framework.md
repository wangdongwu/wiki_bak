##环境配置

**并发测试** 属于 **压力测试** 的一项基本指标。  

**测试环境**  
硬件：华硕K43SJ笔记本，i5 6核 2.50GHZ，4G内存  
操作系统：Ubuntu 桌面版 12.04 LTS  
Ruby版本：1.9.3，2.0.0  
Ruby Web框架：Sinatra，Padrino，Goliath，Rails   
HTTP server：Unicorn，Rainbows    
测试工具：Apache ab  

**主要关注指标**  
每秒事务数（吞吐率）  
Requests per second:    180.29 \[#/sec] (mean)   
平均事务响应时间   
Time per request:       1386.643 \[ms] (mean)    
每个请求实际运行时间  
Time per request:       5.547 \[ms] (mean, across all concurrent requests)   
平均每秒网络流量  
Transfer rate:          51.76 \[Kbytes/sec] received  

**Apache ab 命令**  
`ab -n 8000 -c 250 http://0.0.0.0:3001/`  
表示同时处理8000个请求，250个并发。

##并发测试结果  

###1. Sinatra + Unicorn

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

**ab -n 5000 -c 50 http://0.0.0.0:3001/  -- Sinatra + Unicorn** 
```
Concurrency Level:      50
Time taken for tests:   2.629 seconds
Complete requests:      5000
Requests per second:    1902.18 [#/sec] (mean)
Time per request:       26.286 [ms] (mean)
Time per request:       0.526 [ms] (mean, across all concurrent requests)
Transfer rate:          546.13 [Kbytes/sec] received
```

**ab -n 5000 -c 100 http://0.0.0.0:3001/  -- Sinatra + Unicorn** 
```
Concurrency Level:      100
Time taken for tests:   2.618 seconds
Complete requests:      5000
Requests per second:    1909.82 [#/sec] (mean)
Time per request:       52.361 [ms] (mean)
Time per request:       0.524 [ms] (mean, across all concurrent requests)
Transfer rate:          548.33 [Kbytes/sec] received
```

**ab -n 5000 -c 150 http://0.0.0.0:3001/  -- Sinatra + Unicorn**   
```
Concurrency Level:      150
Time taken for tests:   5.499 seconds
Complete requests:      5000
Requests per second:    909.22 [#/sec] (mean)
Time per request:       164.977 [ms] (mean)
Time per request:       1.100 [ms] (mean, across all concurrent requests)
Transfer rate:          261.04 [Kbytes/sec] received
```

**ab -n 5000 -c 200 http://0.0.0.0:3001/  -- Sinatra + Unicorn**   
`failed`

###2. Sinatra + Unicorn + Rainbows

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


 




