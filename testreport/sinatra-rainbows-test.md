###Sinatra + Rainbows 并发测试

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
