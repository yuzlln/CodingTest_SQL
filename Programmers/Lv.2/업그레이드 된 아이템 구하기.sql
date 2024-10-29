WITH rare AS ( -- 아이템의 희귀도가 'RARE'인 아이템들의 다음 업그레이드 아이템명
    SELECT item_id
    FROM item_tree
    WHERE parent_item_id IN (SELECT item_id
                             FROM item_info
                             WHERE rarity = 'RARE'
                             )
)

SELECT item_id
    , item_name
    , rarity
FROM item_info
WHERE item_id IN (SELECT *
                  FROM rare
                 )
ORDER BY item_id DESC;