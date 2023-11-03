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