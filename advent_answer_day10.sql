
SELECT *
FROM
(SELECT date,
		SUM(CASE WHEN drink_name = 'Mulled wine' THEN quantity ELSE 0 END) AS mulled_wine,
		SUM(CASE WHEN drink_name ='Hot Cocoa' THEN quantity ELSE 0 END) AS hot_cocoa,
		SUM(CASE WHEN drink_name ='Eggnog' THEN quantity ELSE 0 END) AS eggnog,
		SUM(CASE WHEN drink_name ='Peppermint Schnapps' THEN quantity ELSE 0 END) AS peppermint_schnapps,
		SUM(CASE WHEN drink_name ='Baileys' THEN quantity ELSE 0 END)AS baileys,
		SUM(CASE WHEN drink_name ='Sherry' THEN quantity ELSE 0 END) AS sherry
	FROM drinks
	GROUP BY date
	ORDER BY date
)
WHERE hot_cocoa = 38 AND peppermint_schnapps = 298 AND eggnog = 198
;
