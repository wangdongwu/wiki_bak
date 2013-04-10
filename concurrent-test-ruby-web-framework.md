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

-

###并发测试结果  

**1. Sinatra + Unicorn**    
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
**ab -n 7000 -c 250 http://0.0.0.0:3001/  -- Sinatra + Unicorn** 
```txt
Concurrency Level:      250
Time taken for tests:   5.421 seconds
Complete requests:      7000
Failed requests:        0
Write errors:           0
Total transferred:      2058000 bytes
HTML transferred:       343000 bytes
Requests per second:    1291.16 [#/sec] (mean)
Time per request:       193.624 [ms] (mean)
Time per request:       0.774 [ms] (mean, across all concurrent requests)
Transfer rate:          370.70 [Kbytes/sec] received
```




 




