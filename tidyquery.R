install.load::install_load(c("tidyverse", "dbplyr", "nycflights13" , "tidyquery"))


show_dplyr(
  " SELECT origin, dest,
    COUNT(flight) AS num_flts,
    round(SUM(seats)) AS num_seats,
    round(AVG(arr_delay)) AS avg_delay
  FROM flights AS f
   LEFT JOIN planes AS p
    ON f.tailnum = p.tailnum
  WHERE distance BETWEEN 200 AND 300
    AND air_time IS NOT NULL
  GROUP BY origin, dest
  HAVING num_flts > 3000
  ORDER BY num_seats DESC, avg_delay ASC
  LIMIT 2;")

query("SELECT Sepal.Length, Sepal.Width

FROM iris

WHERE Species == 'setosa'

limit 5
")




?dbplyr::tbl_memdb()

query("SELECT cyl, COUNT(*) AS n
FROM mtcars
GROUP BY cyl")
