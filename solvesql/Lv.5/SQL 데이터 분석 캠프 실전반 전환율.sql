WITH pv AS (
  SELECT user_pseudo_id
    , ga_session_id
    , event_timestamp_kst AS pv_at
  FROM ga
  WHERE page_title = '백문이불여일타 SQL 캠프 실전반'
    AND event_name = 'page_view'
)
, scroll AS (
  SELECT user_pseudo_id
    , ga_session_id
    , event_timestamp_kst AS scroll_at
  FROM ga
  WHERE page_title = '백문이불여일타 SQL 캠프 실전반'
    AND event_name = 'scroll'
)
, click AS (
  SELECT user_pseudo_id
    , ga_session_id
    , event_timestamp_kst AS click_at
  FROM ga
  WHERE event_name = 'SQL_advanced_form_click'
)

SELECT COUNT(DISTINCT p.user_pseudo_id, p.ga_session_id) AS pv
  , COUNT(DISTINCT s.user_pseudo_id, s.ga_session_id) AS scroll_after_pv
  , COUNT(DISTINCT c.user_pseudo_id, c.ga_session_id) AS click_after_scroll
  , ROUND(COUNT(DISTINCT s.user_pseudo_id, s.ga_session_id) / COUNT(DISTINCT p.user_pseudo_id, p.ga_session_id), 3) AS pv_scroll_rate
  , ROUND(COUNT(DISTINCT c.user_pseudo_id, c.ga_session_id) / COUNT(DISTINCT p.user_pseudo_id, p.ga_session_id), 3) AS pv_click_rate
  , ROUND(COUNT(DISTINCT c.user_pseudo_id, c.ga_session_id) / COUNT(DISTINCT s.user_pseudo_id, s.ga_session_id), 3) AS scroll_click_rate
FROM pv AS p 
  LEFT JOIN scroll AS s ON p.user_pseudo_id = s.user_pseudo_id
    AND p.ga_session_id = s.ga_session_id
    AND p.pv_at <= s.scroll_at -- 동시에 발생한 이벤트의 경우 다음 퍼널로 전환
  LEFT JOIN click AS c ON s.user_pseudo_id = c.user_pseudo_id
    AND s.ga_session_id = c.ga_session_id
    AND s.scroll_at <= c.click_at; -- 동시에 발생한 이벤트의 경우 다음 퍼널로 전환