# Tugas 8

## Pertanyaan

### Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`

Navigator.push() dan Navigator.pushReplacement() adalah dua metode yang digunakan dalam Flutter untuk mengelola routing antar halaman (page navigation) dalam aplikasi. Perbedaannya adalah:

1. Navigator.push()
`Navigator.push()` digunakan untuk menambahkan halaman baru ke dalam stack navigasi. Halaman baru akan ditambahkan di atas halaman saat ini, dan pengguna dapat kembali ke halaman sebelumnya dengan tombol "back" pada perangkat.
```dart
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Menu()),
  );
}
```

2. Navigator.pushReplacement():

`Navigator.pushReplacement()` juga menambahkan halaman baru ke dalam stack navigasi, tetapi dengan menggantikan halaman saat ini. Ini berarti halaman saat ini akan dihapus dari tumpukan, dan halaman baru akan menjadi halaman terbaru (pop dan push). Pengguna tidak dapat kembali ke halaman sebelumnya, karena halaman tersebut telah digantikan.

```dart
onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HalamanGantian()),
  );
}
```

### Jelaskan masing-masing layout widget pada Flutter

Flutter memiliki berbagai macam widget untuk mengatur tata letak (layout) dalam aplikasi. Berikut adalah beberapa layout widget utama beserta konteks penggunaannya:

1. **Container:**
   - **Konteks Penggunaan:**
     - Digunakan untuk mengelilingi widget lain dan memberikan properti seperti padding, margin, dan dekorasi.
     - Cocok untuk mengatur tata letak dan penataan widget di dalamnya.

   ```dart
   Container(
     padding: EdgeInsets.all(16.0),
     margin: EdgeInsets.symmetric(vertical: 8.0),
     decoration: BoxDecoration(
       color: Colors.blue,
       borderRadius: BorderRadius.circular(8.0),
     ),
     child: Text('Isi Container'),
   )
   ```

2. **Row dan Column:**
   - **Konteks Penggunaan:**
     - `Row` digunakan untuk menempatkan widget dalam satu baris secara horizontal.
     - `Column` digunakan untuk menempatkan widget dalam satu kolom secara vertikal.

   ```dart
   Row(
     children: [
       Icon('Kolom 1'),
       Text('Kolom 2'),
     ],
   )

   Column(
     children: [
       Text('Baris 1'),
       Text('Baris 2'),
     ],
   )
   ```

3. **ListView:**
   - **Konteks Penggunaan:**
     - Digunakan ketika ingin menampilkannya daftar item yang dapat di-scroll.
     - Cocok untuk menampilkan data dinamis secara singkat.

   ```dart
   ListView(
     children: [
       ListTile(
         title: Text('Item 1'),
       ),
       ListTile(
         title: Text('Item 2'),
       ),
	   ...
     ],
   )
   ```

4. **Stack:**
   - **Konteks Penggunaan:**
     - Digunakan untuk menumpuk widget di atas satu sama lain.
     - Cocok untuk membuat tata letak kompleks.

   ```dart
   Stack(
     children: [
       Image(...),
       Positioned(
         bottom: 10.0,
         right: 10.0,
         child: Text('Posisi Teks'),
       ),
     ],
   )
   ```

5. **Expanded dan Flexible:**
   - **Konteks Penggunaan:**
     - `Expanded` dan `Flexible` digunakan dalam `Row` atau `Column` untuk memberikan fleksibilitas pada ukuran widget child.
     - `Expanded` membuat widget memenuhi sebanyak mungkin ruang yang tersedia.
     - `Flexible` memberikan kontrol terhadap seberapa banyak ruang yang diambil oleh child.

   ```dart
   Row(
     children: [
       Expanded(
         child: Container(color: Colors.red),
       ),
       Container(color: Colors.blue),
     ],
   )

   Row(
     children: [
       Flexible(
         flex: 2,
         child: Container(color: Colors.red),
       ),
       Flexible(
         flex: 1,
         child: Container(color: Colors.blue),
       ),
     ],
   )
   ```

6. **GridView:**
   - **Konteks Penggunaan:**
     - Digunakan untuk menampilkan widget dalam tata letak grid (kotak).
     - Cocok untuk menampilkan koleksi item dalam grid.

   ```dart
   GridView.builder(
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
       crossAxisSpacing: 8.0,
       mainAxisSpacing: 8.0,
     ),
     itemBuilder: (context, index) {
       return Container(
         color: Colors.green,
       );
     },
   )
   ```

### Sebutkan elemen input pada form yang kamu pakai!

TextFormField adalah widget dalam Flutter yang digunakan untuk membuat kolom input teks yang dapat menerima masukan dari pengguna. Berikut beberapa fitur mengapa TextFormField sering digunakan:

1. Memproses Input Pengguna:
TextFormField membantu memproses input pengguna dengan mudah, termasuk validasi otomatis, misalnya, memeriksa apakah input sesuai dengan tipe data yang diharapkan (misalnya, angka atau teks).
2. Pemberian Label dan Hints:
Mendukung label dan teks hint yang membantu memberikan panduan kepada pengguna tentang jenis informasi yang diharapkan di dalam kolom input.
3. Validasi Input:
TextFormField memungkinkan penggunaan fungsi validasi untuk memastikan bahwa input pengguna sesuai dengan kriteria tertentu sebelum diizinkan untuk diproses lebih lanjut.

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Nama Pengguna',
    hintText: 'Masukkan nama pengguna',
    icon: Icon(Icons.person),
  ),
  validator: (value) {
    if (value.isEmpty) {
      return 'Nama pengguna tidak boleh kosong';
    }
    return null;
  },
  onSaved: (value) {
    print('Nama Pengguna: $value');
  },
)
```

### Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan Clean Architecture pada aplikasi Flutter melibatkan struktur proyek dan pembagian fokus yang terorganisir dengan tujuan agar lebih modular dan mudah diuji. Salah satu penerapan clean architecture adalah dengan membuat folder untuk membedakan file `.dart` untuk screen, widget, dan sebagainya.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)




# Tugas 7

## Pertanyaan

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

Dalam pengembangan aplikasi Flutter, terdapat dua jenis widget utama: stateless widget dan stateful widget, yang berbeda dalam cara mereka mengelola dan merender komponen widget yang ada di dalanya. Kata kunci perbedaan antara keduanya adalah **statis** dan **dinamis**.

* Stateless Widget:
	Stateless widget adalah widget tanpa keadaan internal (state), yang berarti tampilan widget ini tidak berubah setelah dirender untuk pertama kalinya. Biasanya digunakan untuk elemen statis seperti teks, icon, gambar, dan sebagainya.
   
* Stateful Widget:
   Stateful widget adalah jenis widget yang mampu mengubah tampilannya. Mereka memiliki keadaan internal (state) yang dapat diperbarui, dan ketika state berubah, widget akan dirender kembali sesuai perubahan tersebut. Stateful widget digunakan untuk elemen yang memerlukan interaksi, seperti form, pembaruan item, maupun infinite scroll bar.


### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.


Berikut adalah daftar widget yang digunakan beserta penjelasan fungsinya:

1. `MaterialApp`: Widget utama yang digunakan untuk menginisialisasi aplikasi. Biasanya merupakan parent utama dari widget kita. Biasanya digunakan untuk mengatur tema dan color palette dari applikasi kita..

2. `Scaffold`: Scaffold adalah template dasar yang digunakan untuk membuat tampilan seperti applikasi pada umumnya. Scaffold memiliki parameter `appbar`, dan `drawer` sebagai navigasi utama pada applikasi kita.

3. `AppBar`: Widget yang digunakan untuk membuat AppBar (Panel yang ada di atas applikasi).

4. `SingleChildScrollView`: Widget yang memungkinkan childnya dapat discroll. Digunakan untuk membungkus konten utama.

5. `Padding`: Digunakan untuk memberikan padding pada childnya.

6. `Column`: Widget yang menampilkan elemen-elemen secara vertikal, child dari widget ini adalah list of widget / kumpulan dari widget yang akan disusun secara vertikal.

7. `Text`: Widget untuk menampilkan teks. Dapat pula diatur font, warna, dan styling text disini.

8. `Center`: Digunakan untuk mengatur childnya pada posisi ke tengah secara horizontal dan vertikal.

9. `GridView.count`: Digunakan untuk membuat grid layout dengan jumlah kolom yang diberikan.

10. `InkWell`: Digunakan untuk memberikan efek sentuhan. Ini memungkinkan untuk menangani interaksi pengguna. Biasanya diterapkan pada button.

11. `Icon`: Digunakan untuk menampilkan ikon.

12. `SnackBar`: Ini adalah widget yang digunakan untuk menampilkan pesan singkat di bagian bawah layar.

Semua widget ini digunakan untuk membangun tampilan utama aplikasi Kita dan menampilkan daftar item dalam grid dengan respons saat diklik.

### 3. Step by step implementasi

#### 1. Membuat proyek Flutter baru.

Membuat proyek pada flutter dapat dilakukan dengan melakukan:

```sh
flutter create trading_inventory_mobile
```

#### 2. Memisahkan main.dart menjadi menu.dart

Kita buat agar `main.dart` mereturn widget yang ada pada `menu.dart`. Tujuan dari ini adalah untuk pemisahan fokus. 

Pada `main.dart`. Dimana `Menu()` adalah class widget kita pada `menu.dart`.
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Menu(),
    );
  }
}
```

#### 3. Menyusun Widget pada `menu.dart`

Pada `menu.dart`, kita akan mengimplementasikan appbar terlebih dahulu. Appbar dapat dibentuk dengan cara.

```dart
class Menu extends StatelessWidget {
	Menu({Key? key}) : super(key: key);

	final List<ShopItem> items = [
		ShopItem("Lihat Produk", Icons.checklist),
		ShopItem("Tambah Produk", Icons.add_shopping_cart),
		ShopItem("Logout", Icons.logout),
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Trading Inventory', style: TextStyle(color: Colors.white)),
				backgroundColor: Colors.indigo,
			),
			body: ...
		)
	}
```

Appbar ini akan terdapat text dengan background indigo sesuai parameter yang diberikan.

Selanjutnya, pada halaman menu kita akan membuat halaman ini dapat discroll. Kelanjutan `body` dari widget `Scaffold` di atas adalah. Sehingga dibungkus dengan `SingleChildScrollView`. Di dalamnya akan terdapat tulisan Wellcome dan grid layout yang akan berisi 3 menu utama. Grid layout dapat diimplementasikan dengan menggunakan `GridView`.

```dart
final List<ShopItem> items = [
	ShopItem("Lihat Produk", Icons.checklist),
	ShopItem("Tambah Produk", Icons.add_shopping_cart),
	ShopItem("Logout", Icons.logout),
];
...
body: SingleChildScrollView(
	child: Padding(
		padding: const EdgeInsets.all(10.0),
		child: Column(
			children: <Widget>[
				const Padding(
					padding: EdgeInsets.only(top: 10, bottom: 10),
					child: Text("Wellcome!",
						textAlign: TextAlign.center,
						style: TextStyle(
							fontSize: 30,
							fontWeight: FontWeight.bold
						),
					),
				),
				GridView.count(
					primary: true,
					padding: const EdgeInsets.all(20),
					crossAxisSpacing: 10,
					mainAxisSpacing: 10,
					crossAxisCount: 3,
					shrinkWrap: true,
					children: items.map((ShopItem item) => ShopCard(item)).toList(),
				)
			],
		),
	),
),
```

Child pada GridView kita akan berupa widget yang akan kita tulis sendiri, yaitu `ShopCard`. Yang akan diimplementasikan sebagai berikut. 

```dart
class ShopItem {
	final String name;
	final IconData icon;

	ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
	final ShopItem item;

	const ShopCard(this.item, {super.key});

	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.indigo,
			child: InkWell(
				onTap: (){
					ScaffoldMessenger.of(context)
						..hideCurrentSnackBar()
						..showSnackBar(
							SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
						);
				},
				child: Container(
					padding: EdgeInsets.all(8),
					child: Center(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Icon(
									item.icon,
									color: Colors.white,
									size: 30,
								),
								const Padding(padding: EdgeInsets.all(3)),
								Text(
									item.name,
									textAlign: TextAlign.center,
									style: const TextStyle(color: Colors.white),
								)
							],
						),
					),
				),
			),
		);
	}
}
```

`ShopCard` adalah sebuah button yang merupakan 3 pilihan menu kita. Yaitu "Lihat Produk", "Tambah Produk", dan "Logout". `onTap` adalah fungsi yang akan dijalankan ketika button tersebut ditekan, yaitu membuat sebuah notifikasi "Kamu telah menekan tombol X" dimana X adalah button yang ditekan.