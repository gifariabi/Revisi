<?php 
    class Kegiatan_model extends CI_Model{
        //input data
        function data($data,$table){
            // $query = "INSERT INTO kelas VALUES('','$nama','$spesifik','$jumlah','$kondisi')";
            // $this->db->query($query);
            return $this->db->insert($table,$data);
        }
        // function getId($where,$table){
        //      $this->db->where($where);
        //      $this->db->insert($table,$data);
        // }
        //mengambil database
        function tampil(){
            // $query = $this->db->query("SELECT * FROM kelas");
            // return $query->result();
            $this->db->select('k.id_kegiatan, k.nama_kegiatan, DATE_FORMAT(k.waktu,"%d %M %Y") AS waktu, k.tempat ,FORMAT(k.harga,0) AS harga, k.qr_code,k.foto,k.deskripsi, k.kuota, p.departemen');
            $this->db->from('kegiatan k');
            $this->db->join('programkerja p','p.id_programkerja = k.id_programkerja');
            $this->db->where('k.waktu >= CURRENT_DATE()');
            $this->db->order_by('k.waktu ASC');
            
            $query = $this->db->get();
            // if($query->num_rows() > 0) {
                return $query;
            // }
        }
		function tampil_by_id($where){
			$this->db->select('k.id_kegiatan, k.nama_kegiatan, DATE_FORMAT(k.waktu,"%d %M %Y") AS waktu, k.tempat, FORMAT(k.harga,0) AS harga,k.deskripsi,k.kuota, k.qr_code,k.foto, p.departemen');
            $this->db->from('kegiatan k');
            $this->db->join('programkerja p','p.id_programkerja = k.id_programkerja');
			$this->db->join('organisasi o','o.idOrganisasi = p.idOrganisasi');
            $this->db->where('o.idOrganisasi', $where);
            $this->db->where('k.waktu >= CURRENT_DATE()');
            $this->db->order_by('k.waktu ASC');


			$query = $this->db->get();
			return $query;
		}
        function tampil_date(){
            $this->db->select('k.id_kegiatan, k.nama_kegiatan, k.waktu, k.tempat, FORMAT(k.harga,0) AS harga, k.qr_code,k.foto, p.departemen');
            $this->db->from('kegiatan k');
            $this->db->join('programkerja p','p.id_programkerja = k.id_programkerja');
            $this->db->where("k.waktu >= CURDATE()");

            $query = $this->db->get();
            return $query;
        }
        // menghapus data
        function hapus_data($where,$table){
            $this->db->where($where);
            $this->db->delete($table);
        }
        //mengedit data
        function edit_data($where,$table){
            return $this->db->get_where($table,$where);
        }
        function edit($where,$where2){
            $this->db->select('');
            $this->db->from('kegiatan k');
            $this->db->join('programkerja p','k.id_programkerja = p.id_programkerja');
            $this->db->join('organisasi o', 'p.idOrganisasi = o.idOrganisasi');
            $this->db->join('ang_organisasi a','a.idOrganisasi = o.idOrganisasi');
            $this->db->join('mahasiswa m','a.nim = m.nim');

            $this->db->where('k.id_kegiatan', $where);
            $this->db->where('m.nim', $where2);

            $query =$this->db->get();
            return $query;
        }
        // update data
        function update_data($where,$data,$table){
            $this->db->where($where);
            $this->db->update($table,$data);
        }
        function search($keyword){
            $this->db->like('nama_kegiatan',$keyword);
            $this->db->or_like('harga',$keyword);
            $query=$this->db->get('kegiatan');
            return $query->result();
        }
        function cekKegiatan($where){
            $this->db->select('COUNT(*) as cekKegiatan');
            $this->db->from('kegiatan');
            $this->db->where('nama_kegiatan',$where);
            $query = $this->db->get();
            return $query;

        }
        function cekPresensi($nim, $idKegiatan){
            $sql = "SELECT EXISTS(SELECT * FROM presensi WHERE nim = '$nim' AND id_kegiatan = $idKegiatan) as cekPresensi";

            $query = $this->db->query($sql);
            return $query;
        }
    }
?>