## BigQuery SQL queries ##

# 1. Simple instruction SELECT

SELECT date, title FROM [programmez:184.article]

# 2. On liste les tables concernées une par une dans le FROM :

SELECT
  TIMESTAMP_TO_MSEC(rdt),
  uid,
  uname
FROM
  myproject.MEETUP_20150317,
  myproject.MEETUP_20150318,
  myproject.MEETUP_20150319
WHERE
  rdt >= '2015-03-17 16:45:00'
  AND rdt < '2015-03-19 10:50:00'
ORDER BY
  uname
LIMIT
  500

# 3. Utilisation de la fonction de wildcard de tables :

SELECT
  TIMESTAMP_TO_MSEC(rdt),
  uid,
  uname
FROM (TABLE_DATE_RANGE(myproject.MEETUP_, TIMESTAMP('2015-03-17'), TIMESTAMP('2015-03-19')))
WHERE
  rdt >= '2015-03-18 16:45:00'
  AND rdt < '2015-03-19 10:50:00'
ORDER BY
  uname
LIMIT
  500

# 4. Utilisation de REGEXP_MATCH :

SELECT
  TIMESTAMP_TO_MSEC(rdt),
  uid,
  uname
FROM
  [myproject.mytable_20141108]
WHERE
  cl=18
  AND rdt >= '2014-11-07 23:00:00'
  AND rdt < '2014-11-08 22:59:00'
  AND REGEXP_MATCH(uid, '(?i)^(123456789|55884772)$')
  AND REGEXP_MATCH(mid, '(?i)^(7423456|3465465415)$')
ORDER BY
  uname
LIMIT
  123

