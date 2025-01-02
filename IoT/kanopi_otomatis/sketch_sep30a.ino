#include <Servo.h>

// pin
const int RAIN_SENSOR_PIN = A0;  
const int LDR_PIN = A1;          
const int rainThreshold = 500;   
const int lightThreshold = 600;  // Ambang batas untuk intensitas cahaya (dapat disesuaikan)

const int GREEN_LED_PIN = 7;     // LED hijau untuk indikasi "Kanopi Terbuka"
const int RED_LED_PIN = 8;       // LED merah untuk indikasi "Kanopi Tertutup"

Servo canopyServo;               // Membuat objek Servo untuk kanopi
const int SERVO_PIN = 9;         // Pin kontrol Servo

// Variabel status untuk melacak posisi kanopi
bool isCanopyClosed = false;

// Variabel status untuk mode kontrol
bool isManualMode = false; // Default ke Mode Otomatis

void setup() {
  pinMode(RAIN_SENSOR_PIN, INPUT);  // Atur pin sensor hujan sebagai input
  pinMode(LDR_PIN, INPUT);          // Atur pin LDR sebagai input
  pinMode(GREEN_LED_PIN, OUTPUT);   // Atur pin LED hijau sebagai output
  pinMode(RED_LED_PIN, OUTPUT);     // Atur pin LED merah sebagai output

  canopyServo.attach(SERVO_PIN);    // Sambungkan servo ke pin 9
  canopyServo.write(0);             // Mulai dengan kanopi terbuka (0 derajat)

  // Atur status awal LED
  digitalWrite(GREEN_LED_PIN, HIGH); // LED hijau menyala (kanopi terbuka)
  digitalWrite(RED_LED_PIN, LOW);    // LED merah mati (kanopi tertutup)

  Serial.begin(9600);                // Mulai komunikasi serial untuk debugging
}

void loop() {
  // Periksa perintah Bluetooth
  if (Serial.available()) {
    char command = Serial.read(); // Baca perintah yang masuk
    handleBluetoothCommand(command);
  }

  // Jalankan logika sensor hanya di Mode Otomatis
  if (!isManualMode) {
    // Baca nilai dari sensor
    int rainValue = analogRead(RAIN_SENSOR_PIN);
    int lightValue = analogRead(LDR_PIN);

    // Tampilkan nilai sensor di serial monitor
    Serial.print("Nilai Sensor Hujan: ");
    Serial.println(rainValue);
    Serial.print("Nilai LDR: ");
    Serial.println(lightValue);

    // Prioritas: Deteksi hujan mengesampingkan cahaya
    if (rainValue < rainThreshold) { 
      // Hujan terdeteksi (nilai lebih kecil dari threshold)
      closeCanopy(); // Tutup kanopi jika hujan terdeteksi
    } else if (lightValue > lightThreshold && isCanopyClosed) {
      // Tidak hujan dan cahaya cukup terang
      openCanopy(); // Buka kanopi
    } else if (lightValue <= lightThreshold && !isCanopyClosed) {
      // Tidak hujan tetapi cahaya redup
      closeCanopy(); // Tutup kanopi
    }
  }

  delay(2000); // Tunggu 2 detik sebelum pembacaan berikutnya
}

// Fungsi untuk menangani perintah Bluetooth
void handleBluetoothCommand(char command) {
  if (command == 'O' || command == 'o') { // Perintah untuk membuka kanopi
    openCanopy();
    Serial.println("Perintah: Buka Kanopi (Mode Manual Diaktifkan)");
    isManualMode = true; // Beralih ke Mode Manual
  } else if (command == 'C' || command == 'c') { // Perintah untuk menutup kanopi
    closeCanopy();
    Serial.println("Perintah: Tutup Kanopi (Mode Manual Diaktifkan)");
    isManualMode = true; // Beralih ke Mode Manual
  } else if (command == 'A' || command == 'a') { // Perintah untuk beralih ke Mode Otomatis
    isManualMode = false; // Beralih ke Mode Otomatis
    Serial.println("Beralih ke Mode Otomatis");
  } 
//   else {
//     Serial.println("Perintah Tidak Valid");
//   }
}

// Fungsi untuk menutup kanopi
void closeCanopy() {
  // Memaksa servo untuk bergerak ke posisi 95 derajat (tertutup)
  for (int pos = canopyServo.read(); pos <= 95; pos++) { // Mulai dari posisi saat ini
    canopyServo.write(pos);
    delay(8); // Menunggu sedikit agar gerakan servo halus
  }
  Serial.println("Menutup Kanopi");

  // Perbarui status LED
  digitalWrite(GREEN_LED_PIN, LOW);  // Matikan LED hijau
  digitalWrite(RED_LED_PIN, HIGH);   // Nyalakan LED merah

  // Setel status kanopi ke tertutup
  isCanopyClosed = true;
}

// Fungsi untuk membuka kanopi
void openCanopy() {
  // Memaksa servo untuk bergerak ke posisi 0 derajat (terbuka)
  for (int pos = canopyServo.read(); pos >= 0; pos--) { // Mulai dari posisi saat ini
    canopyServo.write(pos);
    delay(8); // Menunggu sedikit agar gerakan servo halus
  }
  Serial.println("Membuka Kanopi");

  // Perbarui status LED
  digitalWrite(GREEN_LED_PIN, HIGH); // Nyalakan LED hijau
  digitalWrite(RED_LED_PIN, LOW);    // Matikan LED merah

  // Setel status kanopi ke terbuka
  isCanopyClosed = false;
}
