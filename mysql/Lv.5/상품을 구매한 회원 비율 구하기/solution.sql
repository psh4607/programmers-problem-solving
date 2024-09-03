WITH signup AS (
    SELECT ui.USER_ID
    FROM user_info ui
    WHERE YEAR(ui.JOINED) = 2021
),
     sold AS (
         SELECT
             su.USER_ID,
             os.SALES_DATE
         FROM ONLINE_SALE os
                  INNER JOIN signup su ON os.USER_ID = su.USER_ID
         GROUP BY su.USER_ID, os.SALES_DATE
     )
SELECT
    YEAR(s.SALES_DATE) AS YEAR,
    MONTH(s.SALES_DATE) AS MONTH,
    COUNT( s.USER_ID) AS PURCHASED_USERS,
    ROUND(
            COUNT( s.USER_ID) / (SELECT COUNT(USER_ID) FROM signup)
        , 1) AS PURCHASED_RATIO
FROM sold s
GROUP BY YEAR(s.SALES_DATE), MONTH(s.SALES_DATE)
ORDER BY YEAR, MONTH;