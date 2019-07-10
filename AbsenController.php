<?php

namespace frontend\controllers;
use Yii;
use yii\web\Controller;
use frontend\models\AbsenMasukForm;
use common\models\Pegawai;
use common\models\Kehadiran;

class AbsenController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }
	
	public function actionMasuk()
{
    $model = new AbsenMasukForm();
	$model->tanggal=date('Y-m-d');
	$model->jam=date('H:i:s');
	$warning ='';
    if ($model->load(Yii::$app->request->post())) {
        if ($model->validate()) {
			// cek apakah pin pegawai ada
            $pegawai = Pegawai::find()
			->where(['pin'=>$model->pin])
			->one();
			if(!empty($pegawai)){ // jika ada lanjutkan
				// cek apakah pegawai hari ini sudah absen
				$kehadiran = Kehadiran::find()
				->where(['pin'=>$model->pin])
				->andWhere(['tgl_masuk'=>$model->tanggal])
				->one();
				
				//die(print_r($kehadiran));
				
				if(empty($kehadiran)){ // jika belum absen
					$kehadiran = new Kehadiran();
					$kehadiran->pegawai_nip=$pegawai->nip;
					$kehadiran->pin=$pegawai->pin;
					$kehadiran->tgl_masuk =$model->tanggal;
					$kehadiran->jam_masuk = $model->jam;
					$kehadiran->keterangan = $model->keterangan;
					$kehadiran->save();
					return $this->render('kehadiran',['model'=>$kehadiran]);
				}else{// kasih sudah absen
					$warning = 'Data absensi anda sudah tercatat!';
				}
			}else{// jika pin salah
				$warning ='PIN Pegawai tidak ditemukan';
			}	
			
            return $this->render('masuk',['model'=>$model, 'warning'=>$warning]);
        }
		  
	    }
    

    return $this->render('masuk', [
        'model' => $model,
		'warning'=>$warning,
    ]);
}

public function actionPulang()
{
    $model = new \frontend\models\AbsenPulangForm();
	$model->tanggal=date('Y-m-d');
	$model->jam=date('H:i:s');

    if ($model->load(Yii::$app->request->post())) {
        if ($model->validate()) {
            // form inputs are valid, do something here
            return;
        }
    }

    return $this->render('pulang', [
        'model' => $model,
    ]);
}


}
