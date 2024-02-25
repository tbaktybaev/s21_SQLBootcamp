--09
SELECT   address,
         round((Max(age)- Min(age) /Max(age::numeric)),2)                     AS formula,
         round(Avg (age),2)                                                   AS "average",
         round((Max(age)- Min(age) /Max(age::numeric)),2) > Round(Avg(age),2) AS comparison
FROM     person
GROUP BY address
ORDER BY 1;