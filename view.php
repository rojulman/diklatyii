<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Pegawai */

$this->title = $model->nip;
$this->params['breadcrumbs'][] = ['label' => 'Pegawais', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="pegawai-view">



    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->nip], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->nip], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>


<div class="row">
  <div class="col-md-6">
  <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'nip',
            'pin',
            'nama',
            //'tmp_lahir',
            //'tgl_lahir',
			'tmpTanggal',
            //'gender',
			[
			  'attribute'=>'gender',
			  'label'=>'Jenis Kelamin',
			  'value'=>$model->gender=='L'?"Laki-Laki":"Perempuan",
			],
            'nohp',
            'alamat',
			'divisi.nama',
            //'divisi_id',
            'created_at',
            'updated_at',
            'created_by',
            'updated_by',
        ],
    ]) ?>


  
  </div>
  <div class="col-md-6">
  <?= Html::img('@web/uploads/'.$model->nip.'.jpg', 
		    ['alt'=>'gambar 1', 'class'=>'thing']);?>

<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>

    <?= $form->field($model2, 'imageFile')->fileInput() ?>

    <button>Submit</button>

<?php ActiveForm::end() ?>

  </div>
</div>
  


    

</div>
