# Tugas 9

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, bisa dilakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Pendekatan ini disebut sebagai "parsing" atau "deserialisasi" JSON, di mana data JSON diubah menjadi struktur data yang dapat digunakan dalam bahasa pemrograman tertentu. Hal ini bergantung pada kebutuhan dan kompleksitas data. Jika struktur data JSON sederhana dan langsung dapat digunakan, tanpa perlu pemodelan tambahan, pendekatan ini bisa lebih efisien. Namun, jika data kompleks atau memerlukan transformasi khusus, pembuatan model atau skema dapat membantu dalam pemahaman dan manipulasi data dengan lebih baik. Keputusan antara keduanya tergantung pada kompleksitas tugas dan kebutuhan aplikasi.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest mungkin merujuk pada sebuah kelas atau objek dalam konteks aplikasi Flutter yang menangani permintaan atau informasi terkait cookie dalam suatu aplikasi. Membagikan instance CookieRequest ke semua komponen dalam aplikasi Flutter dapat memberikan akses yang konsisten dan terkoordinasi terhadap data cookie di seluruh aplikasi. Dengan demikian, setiap komponen dapat berinteraksi dengan cookie secara terpusat dan dapat mengakses atau memodifikasinya sesuai kebutuhan tanpa perlu mengulang proses pengelolaan cookie di setiap bagian aplikasi. Hal ini dapat meningkatkan efisiensi pengelolaan cookie, mengurangi duplikasi kode, dan memastikan konsistensi data di seluruh aplikasi.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Mekanisme pengambilan data dari JSON hingga ditampilkan pada Flutter melibatkan beberapa langkah. Pertama, data JSON diambil melalui API atau dari penyimpanan lokal. Kemudian, Flutter menggunakan package seperti http untuk mengirim permintaan HTTP dan mendapatkan respons JSON dari server. Data JSON kemudian di-decode menggunakan library seperti dart:convert untuk mengubahnya menjadi objek Dart. Setelah data di-decode, nilai-nilai tersebut dapat digunakan dalam Flutter untuk mengisi widget seperti ListView atau GridView, atau untuk meng-update state dan menampilkan informasi pada antarmuka pengguna menggunakan widget seperti Text atau Image. Proses ini memungkinkan pengembang Flutter untuk mengambil dan menampilkan data dinamis dengan mudah pada aplikasi mereka.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi dari input data akun pada Flutter ke Django melibatkan beberapa langkah. Pertama, pengguna memasukkan informasi akun seperti username dan password melalui antarmuka pengguna Flutter. Data ini dikirim ke server Django melalui permintaan HTTP, yang kemudian diproses oleh API Django. Django menggunakan sistem autentikasi bawaan atau pustaka pihak ketiga seperti Django Rest Framework untuk memverifikasi kredensial pengguna. Jika autentikasi berhasil, server Django menghasilkan token akses yang dikirim kembali ke aplikasi Flutter. Aplikasi Flutter kemudian menyimpan token ini secara lokal untuk digunakan dalam permintaan berikutnya.

Setelah proses autentikasi selesai, menu pada Flutter dapat ditampilkan berdasarkan status otentikasi pengguna. Aplikasi dapat membuat permintaan ke endpoint tertentu pada Django yang memerlukan otorisasi, dan token akses disertakan dalam setiap permintaan untuk memverifikasi identitas pengguna. Django kemudian memproses permintaan tersebut dan memberikan respons yang sesuai, memungkinkan aplikasi Flutter untuk menampilkan menu atau konten yang sesuai dengan hak akses pengguna yang sudah diautentikasi. Proses ini memastikan bahwa hanya pengguna yang sah yang dapat mengakses bagian tertentu dari aplikasi berbasis Flutter yang terhubung ke backend Django.

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

1. MaterialApp: Widget utama untuk konfigurasi aplikasi Flutter.
2. Scaffold: Widget yang menyediakan struktur dasar untuk antarmuka visual aplikasi, termasuk AppBar dan body.
3. AppBar: Menampilkan bilah aplikasi di bagian atas layar.
4. Container: Digunakan untuk styling dengan memberikan latar belakang gradient.
5. Column: Menyusun widget-widget anak secara vertikal.
6. Stack: Menempatkan widget-widget anak di atas satu sama lain.
7. Text: Menampilkan teks dengan gaya tertentu.
8. TextField: Input teks untuk memasukkan username dan password.
9. ElevatedButton: Tombol dengan latar belakang terisi. Digunakan untuk tombol login.
10. GestureDetector: Mendeteksi gesture. Digunakan untuk membuat teks "Create New Account" dapat diklik.
11. Navigator: Digunakan untuk navigasi antar halaman.
12. Form: Kontainer untuk elemen-elemen formulir. Memungkinkan validasi dan pengiriman formulir.
13. GlobalKey: Kunci global untuk mengakses state Form.
14. TextFormField: Elemen formulir spesifik untuk menangani input teks.
15. Icon: Ikon grafis. Digunakan untuk ikon di samping kolom input.
16. TextButton: Tombol dengan tampilan datar. Digunakan untuk tombol "Submit".
17. Navigator: Digunakan untuk navigasi antar halaman.
18. Drawer: Menu sisi kiri yang dapat diakses dengan menggeser dari kiri.
19. FutureBuilder: Widget untuk membangun antarmuka berdasarkan hasil masa depan (asynchronous).
20. ListView.builder: Menampilkan daftar item dengan builder callback.
21. InkWell: Widget yang mendeteksi ketukan dan memberikan respons visual.

## Implementasi
Django
```
Membuat django-app 'authentication'.
Tambahkan 'authentication' ke INSTALLED_APPS.
Install django-cors-headers.
Tambahkan 'corsheaders' ke INSTALLED_APPS.
Tambahkan middleware CorsMiddleware.
Atur variabel CORS_ALLOW_ALL_ORIGINS dan lainnya pada settings.py.
```

Implementasi Login:
```
Buat metode view untuk login pada authentication/views.py.
Buat file urls.py di folder authentication untuk routing login.
Tambahkan path('auth/', include('authentication.urls')) di main project urls.py.
```

Implementasi Logout:
```
Buat metode view untuk logout pada authentication/views.py.
Tambahkan path('logout/', logout, name='logout') di authentication/urls.py.
```

Flutter Implementation:
```
Install package provider dan pbp_django_auth.
Modifikasi root widget di main.dart menggunakan Provider.
```

Halaman Login:
```
Buat file login.dart di folder screens untuk halaman login.
```

Integrasi dengan Django pada main.dart.
```
Gunakan Quicktype untuk membuat model Dart dari JSON Django.
Fetch Data dari Django:
Tambahkan package http untuk melakukan HTTP request.
Fetch data dari Django untuk ditampilkan di aplikasi Flutter.
Form dan Fetch Data:
Hubungkan halaman shoplist_form.dart dengan CookieRequest.
Perbarui tombol tambah untuk mengirim data ke Django.
```

Implementasi Logout:
```
Tambahkan fungsi logout di proyek Django dan implementasikan di aplikasi Flutter.
Hubungkan fungsi logout dengan widget Inkwell di shop_card.dart.
```

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

1. Membuat Drawer
Kode ini digunakan untuk menampilkan drawer di sebelah kiri page.


```dart
import 'package:flutter/material.dart';
import 'package:trading_inventory_mobile/screen/add_item.dart';
import 'package:trading_inventory_mobile/screen/daftar_item.dart';
import 'package:trading_inventory_mobile/screen/menu.dart';


class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
            children: [
                const DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                    ),
                    child: Column(
                        children: [
                            Text(
                                'Shopping List',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text("Catat seluruh keperluan belanjamu di sini!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal
                                ),
                            ),
                        ],
                    ),
                ),
                ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Halaman Utama'),
                    // Bagian redirection ke MyHomePage
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                            builder: (context) => Menu(),
                            ));
                    },
                  ),
                ListTile(
                  leading: const Icon(Icons.add_shopping_cart),
                  title: const Text('Tambah Item'),
                  // Bagian redirection ke ShopFormPage
                  onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const AddItem()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('Daftar Item'),
                  // Bagian redirection ke ShopFormPage
                  onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DaftarItem()));
                  },
                ),
              ],
            ),
        );
    }
}
```

2. Membuat Form Page Add Item
Kita dapat menampilkan input form (TextFormField) dan tombol save untuk menampilkan pop up form yang diisi. Kita dapat menambahkan validator juga.

```dart
import 'package:flutter/material.dart';
import 'package:trading_inventory_mobile/widget/appbar.dart';
import 'package:trading_inventory_mobile/data.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Amount",
                        labelText: "Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _price = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Harga tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Harga harus berupa angka!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Deskripsi tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Data newData = Data(_name, _price, _description);

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Produk berhasil tersimpan'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Nama: $_name'),
                                          Text('Price: $_price'),
                                          Text('Description: $_description')
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
```

3. Menambahkan button untuk menampilkan drawer
Di menu.dart kita menambahkan drawer dalam widget Scaffold (di sebelah kiri app bar).

```dart
return Scaffold(
      appBar: MyAppBar(),
      drawer: const LeftDrawer(),
      body: ...
)
```

4. Menambahkan routing button pada tambah Item
Routing dapat dilakukan dengan menggunakan `Navigator.push`. Navigator dapat dibayangkan seperti struktur data yang menggunakan stack.
```dart
 return Material(
      color: item.color,
      child: InkWell(
        onTap: () {
          if (item.name == "Tambah Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddItem()));
          }else if(item.name == "Lihat Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DaftarItem()));
          }
        },
        ...
```

5. BONUS
Membuat objek model pada data.dart. Class ini dapat digunakan mirip mirip sebagai ORM untuk mengatur Data pada applikasi kita.

```dart
class Data {
  String name;
  int amount;
  String description;

  static List<Data> objects = [];

  Data(this.name, this.amount, this.description) {
    objects.add(this);
  }
}
```

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