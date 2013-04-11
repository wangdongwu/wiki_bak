###Sinatra 并发测试

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

> **5000个请求， 150个并发，运行5次，脚本运行失败：**
```
apr_socket_recv: Connection reset by peer (104)
```