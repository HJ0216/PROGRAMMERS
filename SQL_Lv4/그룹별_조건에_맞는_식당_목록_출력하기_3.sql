  SELECT MP.MEMBER_NAME
         , RR.REVIEW_TEXT
         , TO_CHAR(RR.REVIEW_DATE, 'YYYY-MM-DD') REVIEW_DATE
    FROM REST_REVIEW RR 
    JOIN MEMBER_PROFILE MP 
      ON RR.MEMBER_ID = MP.MEMBER_ID
   WHERE RR.MEMBER_ID = 
(
      SELECT MEMBER_ID
        FROM REST_REVIEW
    GROUP BY MEMBER_ID
    ORDER BY COUNT(MEMBER_ID) DESC
       FETCH FIRST 1 ROW ONLY
)
ORDER BY RR.REVIEW_DATE
         , RR.REVIEW_TEXT
;
