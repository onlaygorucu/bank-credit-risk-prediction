SELECT * FROM bankloans_calisma;
--
SELECT age, income, col_9 from bankloans_calisma LIMIT 20; --col_9 burada excel'deki krediyi batırıp batırmama durumu yani default sütunu.--
SELECT 
	col_9,
    AVG(age),
    AVG(income)
from bankloans_calisma
WHERE col_9 is NOT NULL
GROUP BY col_9;
--
SELECT 
	CASE
    	WHEN age <= 35 THEN '1-Genc (0-35)'
        WHEN age <= 50 then '2-Orta Yas(36-50)'
        ELSE '3-Ileri Yas(50+)'
end as yas_grubu,
COUNT(*) as kisi_sayisi,
Round(AVG(income),1) as ort_gelir,
Round(AVG(debtinc),1) as ort_borc_orani,
Round(AVG(col_9)*100,1) as batirma_riski_yuzde
FROM bankloans_calisma
WHERE col_9 is not NULL
GROUP by yas_grubu
ORDER by yas_grubu;
--
SELECT
	CASE
    	WHEN employ <=3 THEN '1-Kisa Sureli (0-3) Yil'
    	WHEN employ <=9 THEN '2-Orta Sureli (4-9)Yil'
    	ELSE '3-Uzun Sureli (10+) Yil'
		END as calisma_suresi,
		COUNT(*) as kisi_sayisi,
    	Round(AVG(income),1) AS ort_gelir,
    	Round(AVG(col_9)*100,1) AS batirma_riski_yuzde
from bankloans_calisma
WHERE col_9 is not NULL
GROUP by calisma_suresi
ORDER BY calisma_suresi;
--
SELECT  
	CASE
    	WHEN debtinc <=5 then '1-Borcu Az(0-5)'
        WHEN debtinc <=15 then '2- Borcu Orta (6-15)'
        ELSE '3- Borcu Çok (15+)'
        END as borcluluk_durumu,
		COUNT(*) as kisi_sayisi,
        ROUND(AVG(income),1) as ort_gelir,
        ROUND(AVG(col_9)*100,1) as batirma_riski_yuzde
from bankloans_calisma
WHERE col_9 is not NULL
GROUP by borcluluk_durumu
ORDER BY borcluluk_durumu;
--
SELECT  
	COUNT(*) AS kisi_sayisi,
    ROUND(AVG(income),1)  AS ort_gelir,
    ROUND(AVG(debtinc),1) as ort_borc,
    ROUND(AVG(col_9)*100,1) as batirma_riski_yuzde
from bankloans_calisma
WHERE income < 30
	AND debtinc > 15
    and col_9 is not NULL;
--
SELECT
	ed,
	COUNT(*) as kisi_sayisi,
    ROUND(AVG(income),1) as ort_gelir,
    ROUND(AVG(debtinc),1) as ort_borc,
    ROUND(AVG(col_9)*100,1) as batirma_riski_yuzde
FROM bankloans_calisma
WHERE col_9 is not NULL
GROUP by ed
ORDER BY ed;