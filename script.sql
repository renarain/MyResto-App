create database myresto;
use myresto;
create table user(
    id_user int,
    id_kel int,
    username varchar(20),
    password varchar(200),
    nama_user varchar(100),
    alamat varchar(200),
    telp varchar(15),
    email varchar(100));

create table admin_resto(
    id_admin int,
    id_resto int,
    id_kel int,
    username varchar(20),
    password varchar(200),
    nama varchar(100),
    alamat varchar(200),
    telp varchar(15),
    email varchar(100));

create table restoran(
    id_resto int,
    id_kel int,
    nama varchar(100),
    deskripsi varchar(500),
    kategori varchar(100),
    alamat varchar(200));

create table menu(
    id_menu int,
    id_resto int,
    nama_menu varchar(100),
    jenis_menu varchar(100));

create table makanan(
    id_makanan int,
    id_menu int,
    nama_makanan varchar(100),
    harga int,
    stok int,
    deskripsi varchar(500));

create table minuman(
    id_minuman int,
    id_menu int,
    nama_minuman varchar(100),
    harga int,
    stok int,
    deskripsi varchar(500));

create table pembelian(
    id_pembelian int,
    id_user int,
    id_minuman int,
    id_makanan int,
    tanggal datetime,
    jumlah int,
    total_bayar int);

create table menu_favorit(
    id_user int,
    id_menu int);

create table resto_favorit(
    id_user int,
    id_resto int);

create table penilaian(
    id_penilaian int,
    id_user int,
    id_minuman int,
    id_makanan int,
    bintang int,
    komentar varchar(300),
    waktu datetime);

create table waiting_list(
    id_pesanan int,
    id_user int,
    id_makanan int,
    id_minuman int,
    diproses boolean);

create table provinsi(
    id_prov int,
    nama_prov varchar(100));

create table kota(
    id_kota int,
    id_prov int,
    nama_kota varchar(100));

create table kecamatan(
    id_kec int,
    id_kota int,
    nama_kec varchar(100));

create table kelurahan(
    id_kel int,
    id_kec int,
    nama_kel varchar(100));

create table menu_makanan(
    id_menu int,
    id_makanan int);

create table menu_minuman(
    id_menu int,
    id_minuman int);

alter table user add primary key (id_user);
alter table admin_resto add primary key (id_admin);
alter table restoran add primary key (id_resto);
alter table menu add primary key (id_menu);
alter table makanan add primary key (id_makanan);
alter table minuman add primary key (id_minuman);
alter table pembelian add primary key (id_pembelian);
alter table penilaian add primary key (id_penilaian);
alter table waiting_list add primary key (id_pesanan);
alter table provinsi add primary key (id_prov);
alter table kota add primary key (id_kota);
alter table kecamatan add primary key (id_kec);
alter table kelurahan add primary key (id_kel);

alter table user add foreign key fk_user (id_kel) references kelurahan(id_kel);
alter table admin_resto add foreign key fk_admin (id_kel) references kelurahan(id_kel);
alter table admin_resto add foreign key fk_admin1 (id_resto) references restoran(id_resto);
alter table restoran add foreign key fk_resto (id_kel) references kelurahan(id_kel);
alter table menu add foreign key fk_menu (id_resto) references restoran(id_resto);

alter table pembelian add foreign key fk_pembelian (id_user) references user(id_user);
alter table pembelian add foreign key fk_pembelian1 (id_makanan) references makanan(id_makanan);
alter table pembelian add foreign key fk_pembelian2 (id_minuman) references minuman(id_minuman);
alter table kota add foreign key fk_kota (id_prov) references provinsi(id_prov);
alter table kecamatan add foreign key fk_kecamatan (id_kec) references kota(id_kota);
alter table kelurahan add foreign key fk_kelurahan (id_kel) references kecamatan(id_kec);

alter table resto_favorit add foreign key fk_restso_favorit (id_user) references user(id_user);
alter table resto_favorit add foreign key fk_resto_favorit1 (id_resto) references restoran(id_resto);
alter table menu_favorit add foreign key fk_menu_favorit (id_user) references user(id_user);
alter table menu_favorit add foreign key fk_menu_favorit1 (id_menu) references menu(id_menu);

alter table penilaian add foreign key fk_penilaian (id_user) references user(id_user);
alter table penilaian add foreign key fk_penilaian1 (id_makanan) references makanan(id_makanan);
alter table penilaian add foreign key fk_penilaian2 (id_minuman) references minuman(id_minuman);

alter table waiting_list add foreign key fk_pesan (id_user) references user(id_user);
alter table waiting_list add foreign key fk_pesan1 (id_makanan) references makanan(id_makanan);
alter table waiting_list add foreign key fk_pesan2 (id_minuman) references minuman(id_minuman);

alter table menu_makanan add foreign key fk_menu_makanan (id_menu) references menu(id_menu);
alter table menu_makanan add foreign key fk_menu_makanan1 (id_makanan) references makanan(id_makanan);
alter table menu_minuman add foreign key fk_menu_minuman (id_menu) references menu(id_menu);
alter table menu_minuman add foreign key fk_menu_minuman1 (id_minuman) references minuman(id_minuman);

show tables;
desc user;
desc admin_resto;
desc restoran;
desc makanan;
desc minuman;
desc pembelian;
desc menu;
desc menu_favorit;
desc menu_makanan;
desc menu_minuman;
desc resto_favorit;
desc penilaian;
desc waiting_list;
desc kecamatan;
desc kelurahan;
desc kota;
desc provinsi;

