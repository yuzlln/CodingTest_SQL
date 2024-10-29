WITH up AS ( -- 업그레이드 가능한 item_id
    SELECT parent_item_id
    FROM item_tree
    WHERE parent_item_id IS NOT NULL -- ROOT아이템을 제외한
)

SELECT item_id
    , item_name
    ,rarity
FROM item_info
WHERE item_id NOT IN (SELECT * -- 더이상 업그레이드 가능하지 않는 item_id
                      FROM up
                      )
ORDER BY item_id DESC;