# bank-credit-risk-prediction
# Predicting bank loan defaults using EDA and Logistic Regression in Python.
#Banka Kredi Risk Analizi ve Batık Tahmin Modeli
## İş Problemi
#Banka kredi onay süreçlerinde, kredisini geri ödeyemeyecek (batık/default) müşterileri önceden tespit etmek, finansal kurumlar için milyonlarca liralık zararı önlemek anlamına gelir. Bu projede, müşteri demografisi ve finansal geçmiş verileri kullanılarak uçtan uca bir risk analizi yapılmış ve batık tahmin modeli geliştirilmiştir.
## Keşifçi Veri Analizi (EDA) Önemli Çıktılar
1. **Borç Yükü Tehlikesi:** Isı haritası (korelasyon) analizine göre krediyi batırmaya iten en büyük matematiksel tetikleyici **0.39** skoruyla borç/gelir oranı (`debtinc`) olmuştur.
2. **İstikrarın Gücü:** Riski en çok düşüren faktör **-0.28** skoruyla mevcut işteki çalışma süresi (`employ`) olarak tespit edilmiştir. Düzenli çalışma süresi arttıkça, batırma riski net bir şekilde azalmaktadır.
3. **Riskli Segmentin Tespiti:** SQL ve Pandas filtrelemeleri sonucunda; geliri 30 birimden düşük ve borç/gelir oranı 15'ten yüksek olan kitlenin kredi batırma riski **%62.1** olarak ölçülmüştür. 

## Makine Öğrenmesi Modeli ve Ticari Optimizasyon
Projeye standart Lojistik Regresyon algoritması ile başlanmış ve %80 genel başarı elde edilmiştir. Ancak veri setindeki "kredisini ödeyenler" çoğunluğunun modelde yarattığı dengesizlik (imbalance) nedeniyle, ilk model batık müşterilerin sadece **%44'ünü** (Recall) yakalayabilmiştir.

** Çözüm ve Strateji:** Bankanın asıl zararı olan "batık müşteriyi kaçırma" maliyetini önlemek adına, modele `class_weight='balanced'` parametresi uygulanmıştır. Bu ticari optimizasyon sayesinde modelin tehlikeli müşterileri önceden yakalama oranı **%78'e** çıkarılmış ve kurumun finansal riski minimize edilmiştir.

## Proje Dosyaları
* `bankloans_calisma.sql`: Veritabanı üzerinde yapılan ilk süzgeçleme, gruplama ve keşif sorguları.
* `bankloans_calisma.ipynb`: Veri temizliği, görselleştirme (EDA) ve Makine Öğrenmesi modelinin Python ile geliştirilmiş kodları.
* `bankloans_calisma.csv`: Analizde kullanılan ham veri seti.
