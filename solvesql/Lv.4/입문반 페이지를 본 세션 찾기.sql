WITH page AS ( -- 입문반 페이지를 본 세션
  SELECT COUNT(DISTINCT user_pseudo_id, ga_session_id) AS total
    , COUNT(DISTINCT CASE WHEN page_title = '백문이불여일타 SQL 캠프 입문반'
                            AND event_name = 'page_view'
                            THEN CONCAT(user_pseudo_id, ga_session_id)
                          ELSE NULL END) AS pv_yes
  FROM ga
)

SELECT total
  , total - pv_yes AS pv_no
  , pv_yes
FROM page;