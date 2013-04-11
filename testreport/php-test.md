###PHP 并发测试

> **5000个请求，50、100、150、300、350、400、450个并发，运行5次，结果如下：**
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
Concurrency Level:      400.0|400.0|400.0|400.0|400.0|
Time taken for tests:   5.717|17.431|26.971|4.318|13.813|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    874.64|286.85|185.38|1158.06|361.98|
Time per request:       457.331|1394.469|2157.691|345.405|1105.027|
Time per request        1.143|3.486|5.394|0.864|2.763|
Transfer rate:          219.51|71.99|45.67|290.65|90.85|
Concurrency Level:      400.00
Time taken for tests:   13.65
Complete requests:      5000.00
Requests per second:    573.38
Time per request:       1091.98
Time per request        2.73
Transfer rate:          143.73
Concurrency Level:      450.0|450.0|450.0|450.0|450.0|
Time taken for tests:   7.788|16.969|16.525|13.522|3.189|
Complete requests:      5000.0|5000.0|5000.0|5000.0|5000.0|
Requests per second:    642.0|294.65|302.57|369.78|1567.86|
Time per request:       700.933|1527.237|1487.262|1216.952|287.015|
Time per request:       1.558|3.394|3.305|2.704|0.638|
Transfer rate:          161.13|73.95|75.94|92.81|393.5|
Concurrency Level:      450.00
Time taken for tests:   11.60
Complete requests:      5000.00
Requests per second:    635.37
Time per request:       1043.88
Time per request:       2.32
Transfer rate:          159.47
```