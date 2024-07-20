# Task

## Proje Açıklaması
Task, teknik olarak kendini geliştirmek amacıyla hazırlanan bir projedir. Kullanıcılar, teknik görevleri takip edebilir ve yönetebilir. Uygulama, Firebase kullanarak kullanıcı kimlik doğrulama işlemlerini gerçekleştirir ve kullanıcı durumunu saklar, böylece uygulama yeniden başlatıldığında ana ekran açılır. Ayrıca, yerel bir JSON dosyasından veri çekerek kullanıcı arayüzünde gösterir ve bu verileri düzenleyerek Hive ile önbelleğe alır.

## Özellikler
- **Login** ve **Register** işlemleri (Firebase ile)
- Kullanıcı durumu saklama ve oturum açma durumu yönetimi
- Yerel JSON verilerini çekme ve kullanıcı arayüzünde gösterme
- Verileri düzenleme ve Hive ile yerel olarak saklama

## Kullanılan Teknolojiler ve Kütüphaneler
- **Flutter**: Uygulama geliştirme için
- **Firebase**: Kimlik doğrulama ve veri saklama için
- **Provider**: Durum yönetimi için
- **Hive**: Yerel depolama için
- **Local JSON**: Verileri çekmek ve göstermek için

## Kurulum ve Çalıştırma Talimatları
1. **Depoyu Klonlayın**:
    ```bash
    git clone https://github.com/kullaniciadi/task.git
    cd task
    ```

2. **Bağımlılıkları Yükleyin**:
    ```bash
    flutter pub get
    ```

3. **Firebase Yapılandırmasını Tamamlayın**:
    - Firebase projenizi oluşturun ve `google-services.json` dosyasını `android/app` dizinine yerleştirin.
    - `Info.plist` dosyasına gerekli Firebase bilgilerini ekleyin.

4. **Uygulamayı Çalıştırın**:
    ```bash
    flutter run
    ```

## Ekran Görüntüleri
| Ana Sayfa | Görev Ekleme | Görev Detayları |
| --- | --- | --- |
| ![Ana Sayfa](images/home.png) | ![Görev Ekleme](images/add_task.png) | ![Görev Detayları](images/task_details.png) |

## Katkıda Bulunma
Bu projeye katkıda bulunmak isterseniz, lütfen bir pull request açın veya bir issue oluşturun. Herhangi bir katkı memnuniyetle karşılanır.

## Lisans
Bu proje MIT Lisansı ile lisanslanmıştır. Daha fazla bilgi için `LICENSE` dosyasına bakın.
