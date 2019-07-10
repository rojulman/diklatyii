<?php
 use yii\widgets\DetailView;
 use frontend\models\AbsenMasukForm;
?>
<h3>Data Absen Masuk PIN Pegawai : <?=$model->pin?></h3>
<?php echo $warning ?>
<?= DetailView::widget([
    'model'=>$model,
	'attributes'=>[
		'tgl_masuk',
		'jam_masuk',
		'pin',
		'keterangan'
	],
])?>
