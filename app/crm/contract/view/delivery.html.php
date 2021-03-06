<?php 
/**
 * The delivery file of contract module of RanZhi.
 *
 * @copyright   Copyright 2009-2018 青岛易软天创网络科技有限公司(QingDao Nature Easy Soft Network Technology Co,LTD, www.cnezsoft.com)
 * @license     ZPL (http://zpl.pub/page/zplv12.html)
 * @author      Tingting Dai <daitingting@xirangit.com>
 * @package     contract 
 * @version     $Id$
 * @link        http://www.ranzhi.org
 */
?>
<?php include '../../../sys/common/view/header.modal.html.php';?>
<?php include '../../../sys/common/view/kindeditor.html.php';?>
<?php include '../../../sys/common/view/chosen.html.php';?>
<?php include '../../common/view/datepicker.html.php';?>
<form method='post' id='ajaxForm' action='<?php echo inlink('delivery', "contractID=$contract->id")?>'>
  <table class='table table-form'>
    <tr>
      <th class='w-60px'><?php echo $lang->contract->deliveredBy;?></th>
      <td class='w-p40'>
        <div class='input-group'>
          <?php echo html::select('deliveredBy', $users, $this->app->user->account, "class='form-control chosen'");?>
          <div class='input-group-addon'>
            <label class='checkbox-inline'><input type='checkbox' id='finish' name='finish' value='1'> <?php echo $lang->contract->completeDelivery;?></label>
          </div>
        </div>
      </td>
      <td></td>
    </tr>
    <tr>
      <th><?php echo $lang->contract->deliveredDate;?></th>
      <td><?php echo html::input('deliveredDate', '', "class='form-control form-date'");?></td>
      <td></td>
    </tr>
    <tr>
      <th><?php echo $lang->contract->handlers;?></th>
      <td colspan='2'><?php echo html::select('handlers[]', $users, $contract->handlers, "class='form-control chosen' multiple");?></td>
    </tr>
    <tr>
      <th><?php echo $lang->comment;?></th>
      <td colspan='2'><?php echo html::textarea('comment');?></td>
    </tr>
    <tr>
      <th></th>
      <td><?php echo html::submitButton();?></td>
      <td></td>
    </tr>
  </table>
</form>
<?php include '../../../sys/common/view/footer.modal.html.php';?>
