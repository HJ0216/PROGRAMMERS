  SELECT MCDP_CD "진료과 코드", 
         COUNT(APNT_NO) "5월예약건수"
    FROM APPOINTMENT
   WHERE TO_CHAR(APNT_YMD, 'YYYY-MM') = '2022-05'
GROUP BY MCDP_CD
ORDER BY "5월예약건수", 
         "진료과 코드"
;
