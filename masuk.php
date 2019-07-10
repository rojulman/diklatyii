<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\AbsenMasukForm */
/* @var $form ActiveForm */
?>
<div class="masuk">
<h2>Absensi Masuk</h2>
<?=Html::img('@web/images/jam7.png',['style'=>'width:20%']); ?>

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'tanggal')
		          ->textInput(['readonly'=>true]) ?>
        <?= $form->field($model, 'jam')
				  ->textInput(['readonly'=>true]) ?>
        <?= $form->field($model, 'pin') ?>
        <?= $form->field($model, 'keterangan') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>
	
<?php echo $warning ?>
</div><!-- masuk -->
