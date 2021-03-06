<?php
class Model_presensi extends CI_Model{
	
		
	function tampilPresensi($where){
        $this->db->distinct();
		$this->db->select('m.nama, m.nim, k.nama_kegiatan, waktu, status, tempat, waktu_submit, prodi');
        $this->db->from('kegiatan k');
        $this->db->join('presensi p','k.id_kegiatan =  p.id_kegiatan');
        $this->db->join('mahasiswa m','p.nim =  m.nim');
        $this->db->where('k.id_kegiatan',$where);

        $query = $this->db->get();
       	//if($query->num_rows() > 0) {
        return $query->result();
    	//}
    }
    function hitungPresensi($nim){
        // SELECT COUNT(*) from presensi WHERE nim = 670117400
        $this->db->select('COUNT(*) as hitungPresensi');
        $this->db->from('presensi');
        $this->db->where('nim', $nim);
        
        $query = $this->db->get();
        return $query;
    }
    function historiPresensi($nim){
        $this->db->select('waktu_submit, nim, p.id_kegiatan, nama_kegiatan, foto');
        $this->db->from('presensi p');
        $this->db->join('kegiatan k', 'p.id_kegiatan = k.id_kegiatan');
        $this->db->where('nim', $nim);

        $query = $this->db->get();
        return $query;
    }
}
?>