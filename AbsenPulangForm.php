<?php
namespace frontend\models;

use yii\base\Model;

class AbsenPulangForm extends Model {
	public $tanggal;
	public $jam;
	public $pin;
	public $keterangan;
	
	public function rules(){
		return[
		  [['tanggal','jam','pin'],'required',
				'message'=>'{attribute} wajib di isi'],
		  [['pin'],'integer','message'=>'harus angka Ya'],
		  [['keterangan'],'string','max'=>45]
		];
	}
	
	public function attributeLabels(){
		return[
			'tanggal'=>'Tanggal Pulang',
			'jam'=>'Jam Pulang',
			'pin'=>'Pin Pegawai',
			'keterangan'=>'Keterangan'
		];
	}
	

} 