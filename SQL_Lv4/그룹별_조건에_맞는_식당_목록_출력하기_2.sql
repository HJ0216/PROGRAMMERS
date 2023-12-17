WITH RANK AS (
      SELECT MEMBER_ID
             , RANK() OVER (ORDER BY COUNT(MEMBER_ID) DESC) RANKING
        FROM REST_REVIEW
    GROUP BY MEMBER_ID
)
  SELECT MP.MEMBER_NAME
         , RR.REVIEW_TEXT
         , TO_CHAR(RR.REVIEW_DATE, 'YYYY-MM-DD') REVIEW_DATE
    FROM REST_REVIEW RR
         JOIN RANK R 
           ON RR.MEMBER_ID = R.MEMBER_ID
         JOIN MEMBER_PROFILE MP 
           ON RR.MEMBER_ID = MP.MEMBER_ID
   WHERE R.RANKING = 1
ORDER BY RR.REVIEW_DATE
         , RR.REVIEW_TEXT
;
