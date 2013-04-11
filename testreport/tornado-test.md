###Tornado 并发测试

> **5000个请求，50、100、150、300、500、550、800、900、1000个并发，运行5次，结果如下：**
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
