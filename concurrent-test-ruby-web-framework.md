> **并发测试** 属于 **压力测试** 的一项基本指标。  

###测试环境  

硬件：华硕K43SJ笔记本，i5 6核 2.50GHZ，4G内存  
操作系统：Ubuntu 桌面版 12.04 LTS  
Ruby版本：1.9.3  
Python版本：2.7.3
Ruby Web框架：Sinatra，Tornado，php   
HTTP server：Unicorn，Rainbows，Apache    
测试工具：Apache ab  

-

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

-

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

> **5000个请求， 150个并发，运行5次，脚本运行失败：**
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
> **5000个请求，50个并发，运行5次，结果如下：**
```
Concurrency Level:      50.0|50.0|50.0|50.0|50.0|
Time taken for tests:   2.627|2.656|2.715|2.706|2.689|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    1903.0|1882.22|1841.9|1847.83|1859.52|
Time per request:       26.274|26.564|27.146|27.059|26.889|
Time per request:       0.525|0.531|0.543|0.541|0.538|
Transfer rate:          546.37|540.4|528.83|530.53|533.88|
```
**均值：**
```
Concurrency Level:      50.00
Time taken for tests:   2.68  seconds
Complete requests:      5000.00
Requests per second:    1866.89 [#/sec] (mean)
Time per request:       26.79 [ms] (mean)
Time per request:       0.54 [ms] (mean, across all concurrent requests)
Transfer rate:          536.00 [Kbytes/sec] received
```


> **5000个请求，100个并发，运行5次，结果如下：**
```
Concurrency Level:      100.0|100.0|100.0|100.0|100.0|
Time taken for tests:   2.485|2.653|2.676|2.712|2.712|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    2012.16|1884.33|1868.15|1843.96|1843.33|
Time per request:       49.698|53.069|53.529|54.231|54.25|
Time per request:       0.497|0.531|0.535|0.542|0.542|
Transfer rate:          577.71|541.01|536.36|529.42|529.24|
```
**均值：**
```
Concurrency Level:      100.00
Time taken for tests:   2.65 seconds
Complete requests:      5000.00
Requests per second:    1890.39 [#/sec] (mean)
Time per request:       52.96 [ms] (mean)
Time per request:       0.53 [ms] (mean, across all concurrent requests)
Transfer rate:          542.75 [Kbytes/sec] received
```


> **5000个请求， 150个并发，运行5次，结果如下：**
```
Concurrency Level:      150.0|150.0|150.0|150.0|150.0|
Time taken for tests:   2.496|2.674|2.717|2.695|2.68|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    2003.07|1870.05|1840.33|1855.11|1865.99|
Time per request:       74.885|80.212|81.507|80.858|80.386|
Time per request:       0.499|0.535|0.543|0.539|0.536|
Transfer rate:          575.1|536.91|528.38|532.62|535.74|
```
**均值：**
```
Concurrency Level:      150.00
Time taken for tests:   2.65 seconds
Complete requests:      5000.00
Requests per second:    1886.91 [#/sec] (mean)
Time per request:       79.57 [ms] (mean)
Time per request:       0.53 [ms] (mean, across all concurrent requests)
Transfer rate:          541.75 [Kbytes/sec] received
```


> **5000个请求， 300个并发，运行5次，结果如下：**
```
Concurrency Level:      300.0|300.0|300.0|300.0|300.0|
Time taken for tests:   2.501|2.679|2.927|2.748|2.724|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    1998.98|1866.17|1708.21|1819.34|1835.65|
Time per request:       150.076|160.757|175.622|164.895|163.43|
Time per request:       0.5|0.536|0.585|0.55|0.545|
Transfer rate:          573.93|535.8|490.44|522.35|527.03|
```
**均值：**
```
Concurrency Level:      300.00
Time taken for tests:   2.72 seconds
Complete requests:      5000.00
Requests per second:    1845.67 [#/sec] (mean)
Time per request:       162.96 [ms] (mean)
Time per request:       0.54 [ms] (mean, across all concurrent requests)
Transfer rate:          529.91 [Kbytes/sec] received
```


> **5000个请求， 500个并发，运行5次，结果如下：**
```
Concurrency Level:      500.0|500.0|500.0|500.0|500.0|
Time taken for tests:   4.347|4.467|3.457|4.565|4.26|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    1150.18|1119.34|1446.37|1095.34|1173.65|
Time per request:       434.714|446.693|345.694|456.48|426.022|
Time per request:       0.869|0.893|0.691|0.913|0.852|
Transfer rate:          330.23|321.37|415.27|314.48|336.97|
```
**均值：**
```
Concurrency Level:      500.00
Time taken for tests:   4.22 seconds
Complete requests:      5000.00
Requests per second:    1196.98 [#/sec] (mean)
Time per request:       421.92 [ms] (mean)
Time per request:       0.84 [ms] (mean, across all concurrent requests)
Transfer rate:          343.66 [Kbytes/sec] received
```


> **5000个请求， 550个并发，运行5次，结果如下：**
```
Concurrency Level:      550.0|550.0|550.0|550.0|550.0|
Time taken for tests:   5.02|8.298|3.469|5.651|8.483|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    995.97|602.54|1441.54|884.78|589.41|
Time per request:       552.224|912.796|381.536|621.62|933.139|
Time per request:       1.004|1.66|0.694|1.13|1.697|
Transfer rate:          285.95|173.0|413.88|254.03|169.22|
```
**均值：**
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

> **5000个请求，50、100、150、300、500、550个并发，运行5次，结果如下：**
```
Concurrency Level:      50.0|50.0|50.0|50.0|50.0|
Time taken for tests:   1.355|1.412|1.484|1.466|1.499|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    3691.34|3541.75|3368.83|3409.49|3336.14|
Time per request:       13.545|14.117|14.842|14.665|14.987|
Time per request:       0.271|0.282|0.297|0.293|0.3|
Transfer rate:          857.95|823.18|782.99|792.44|775.39|

Concurrency Level:      50.00
Time taken for tests:   1.44 
Complete requests:      5000.00
Requests per second:    3469.51
Time per request:       14.43
Time per request:       0.29 
Transfer rate:          806.39

Concurrency Level:      100.0|100.0|100.0|100.0|100.0|
Time taken for tests:   1.337|1.451|1.489|1.483|1.496|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    3740.24|3446.49|3358.79|3371.74|3342.1|
Time per request:       26.736|29.015|29.773|29.658|29.921|
Time per request:       0.267|0.29|0.298|0.297|0.299|
Transfer rate:          869.31|801.04|780.66|783.67|776.78|

Concurrency Level:      100.00
Time taken for tests:   1.45
Complete requests:      5000.00
Requests per second:    3451.87
Time per request:       29.02
Time per request:       0.29
Transfer rate:          802.29

Concurrency Level:      150.0|150.0|150.0|150.0|150.0|
Time taken for tests:   1.516|1.631|1.645|1.471|1.546|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    3297.52|3065.5|3039.68|3398.52|3233.7|
Time per request:       45.489|48.932|49.347|44.137|46.387|
Time per request:       0.303|0.326|0.329|0.294|0.309|
Transfer rate:          766.42|712.49|706.49|789.89|751.58|

Concurrency Level:      150.00
Time taken for tests:   1.56
Complete requests:      5000.00
Requests per second:    3206.98
Time per request:       46.86
Time per request:       0.31
Transfer rate:          745.37

Concurrency Level:      300.0|300.0|300.0|300.0|300.0|
Time taken for tests:   1.468|1.708|2.331|1.933|3.161|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    3405.52|2927.76|2145.29|2586.5|1581.65|
Time per request:       88.092|102.468|139.841|115.987|189.675|
Time per request:       0.294|0.342|0.466|0.387|0.632|
Transfer rate:          791.52|680.47|498.61|601.16|367.61|

Concurrency Level:      300.00
Time taken for tests:   2.12
Complete requests:      5000.00
Requests per second:    2529.34
Time per request:       127.21
Time per request:       0.42
Transfer rate:          587.87

Concurrency Level:      500.0|500.0|500.0|500.0|500.0|
Time taken for tests:   2.101|2.559|2.109|1.926|3.788|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    2380.35|1954.19|2370.69|2595.63|1319.99|
Time per request:       210.053|255.861|210.909|192.632|378.79|
Time per request:       0.42|0.512|0.422|0.385|0.758|
Transfer rate:          553.24|454.2|551.0|603.28|306.79|

Concurrency Level:      500.00
Time taken for tests:   2.50
Complete requests:      5000.00
Requests per second:    2124.17
Time per request:       249.65
Time per request:       0.50
Transfer rate:          493.70

Concurrency Level:      550.0|550.0|550.0|550.0|550.0|
Time taken for tests:   1.522|2.056|1.968|3.142|2.564|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    3285.57|2431.69|2540.84|1591.59|1950.08|
Time per request:       167.399|226.18|216.464|345.566|282.039|
Time per request:       0.304|0.411|0.394|0.628|0.513|
Transfer rate:          763.64|565.18|590.55|369.92|453.24|

Concurrency Level:      550.00
Time taken for tests:   2.25
Complete requests:      5000.00
Requests per second:    2359.95
Time per request:       247.53
Time per request:       0.45
Transfer rate:          548.51
```

> **5000个请求，800、900、1000个并发，运行5次，结果如下：**
```
Concurrency Level:      800.0|800.0|800.0|800.0|800.0|
Time taken for tests:   2.113|3.364|2.587|3.08|3.638|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    2366.66|1486.4|1932.45|1623.63|1374.3|
Time per request:       338.029|538.212|413.982|492.723|582.112|
Time per request:       0.423|0.673|0.517|0.616|0.728|
Transfer rate:          550.06|345.47|449.14|377.37|319.42|
Concurrency Level:      800.00
Time taken for tests:   2.96
Complete requests:      5000.00
Requests per second:    1756.69
Time per request:       473.01
Time per request:       0.59
Transfer rate:          408.29

Concurrency Level:      900.0|900.0|900.0|900.0|900.0|
Time taken for tests:   1.585|2.566|2.58|2.119|2.552|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    3155.2|1948.63|1938.18|2359.36|1958.98|
Time per request:       285.244|461.863|464.354|381.459|459.424|
Time per request:       0.317|0.513|0.516|0.424|0.51|
Transfer rate:          733.34|452.9|450.47|548.37|455.31|
Concurrency Level:      900.00
Time taken for tests:   2.28
Complete requests:      5000.00
Requests per second:    2272.07
Time per request:       410.47
Time per request:       0.46
Transfer rate:          528.08

Concurrency Level:      1000.0|1000.0|1000.0|1000.0|1000.0|
Time taken for tests:   2.581|2.11|2.129|3.627|2.1|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    1936.92|2370.07|2348.35|1378.71|2381.04|
Time per request:       516.284|421.928|425.832|725.314|419.985|
Time per request:       0.516|0.422|0.426|0.725|0.42|
Transfer rate:          450.18|550.86|545.81|320.44|553.4|
Concurrency Level:      1000.00
Time taken for tests:   2.51
Complete requests:      5000.00
Requests per second:    2083.02
Time per request:       501.87
Time per request:       0.50
Transfer rate:          484.14
```

> **5000个请求， 1050个并发，运行5次，脚本运行失败：**
```
socket: Too many open files (24)
```

####4. PHP

> **5000个请求，50、100、150、300、350个并发，运行5次，结果如下：**
```
Concurrency Level:      50.0|50.0|50.0|50.0|50.0|
Time taken for tests:   0.549|0.606|0.619|0.63|0.66|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    9114.47|8256.4|8084.0|7935.74|7580.09|
Time per request:       5.486|6.056|6.185|6.301|6.596|
Time per request:       0.11|0.121|0.124|0.126|0.132|
Transfer rate:          2287.52|2072.16|2028.89|1991.68|1902.42|
Concurrency Level:      50.00
Time taken for tests:   0.61
Complete requests:      5000.00
Requests per second:    8194.14
Time per request:       6.12
Time per request:       0.12
Transfer rate:          2056.53

Concurrency Level:      100.0|100.0|100.0|100.0|100.0|
Time taken for tests:   0.646|0.659|0.653|0.633|0.638|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    7737.61|7585.41|7660.76|7904.88|7839.77|
Time per request:       12.924|13.183|13.054|12.65|12.755|
Time per request:       0.129|0.132|0.131|0.127|0.128|
Transfer rate:          1941.96|1903.76|1922.67|1983.94|1967.6|
Concurrency Level:      100.00
Time taken for tests:   0.65
Complete requests:      5000.00
Requests per second:    7745.69
Time per request:       12.91
Time per request:       0.13
Transfer rate:          1943.99

Concurrency Level:      150.0|150.0|150.0|150.0|150.0|
Time taken for tests:   0.8|0.853|2.511|2.659|2.221|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    6251.84|5861.69|1991.56|1880.44|2251.26|
Time per request:       23.993|25.59|75.318|79.768|66.629|
Time per request:       0.16|0.171|0.502|0.532|0.444|
Transfer rate:          1569.06|1471.15|499.84|471.95|565.01|
Concurrency Level:      150.00
Time taken for tests:   1.81
Complete requests:      5000.00
Requests per second:    3647.36
Time per request:       54.26
Time per request:       0.36
Transfer rate:          915.40

Concurrency Level:      300.0|300.0|300.0|300.0|300.0|
Time taken for tests:   4.18|11.32|5.064|5.721|3.835|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    1196.25|441.71|987.44|873.95|1303.63|
Time per request:       250.783|679.179|303.817|343.27|230.127|
Time per request:       0.836|2.264|1.013|1.144|0.767|
Transfer rate:          300.23|110.86|247.82|219.34|327.18|
Concurrency Level:      300.00
Time taken for tests:   6.02
Complete requests:      5000.00
Requests per second:    960.60
Time per request:       361.44
Time per request:       1.20
Transfer rate:          241.09

Concurrency Level:      350.0|350.0|350.0|350.0|350.0|
Time taken for tests:   14.589|12.35|4.043|7.7|12.821|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    342.72|404.85|1236.85|649.32|389.98|
Time per request:       1021.248|864.522|282.977|539.027|897.488|
Time per request:       2.918|2.47|0.809|1.54|2.564|
Transfer rate:          86.01|101.61|310.42|162.96|97.88|
Concurrency Level:      350.00
Time taken for tests:   10.30
Complete requests:      5000.00
Requests per second:    604.74
Time per request:       721.05
Time per request:       2.06
Transfer rate:          151.78
```