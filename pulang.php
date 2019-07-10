<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\models\AbsenPulangForm */
/* @var $form ActiveForm */
?>
<div class="pulang">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'tanggal') ?>
        <?= $form->field($model, 'jam') ?>
        <?= $form->field($model, 'pin') ?>
        <?= $form->field($model, 'keterangan') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>
	
	<div class="p-3 mb-2 bg-danger text-white"><?=$warning?></div>


</div><!-- pulang -->
