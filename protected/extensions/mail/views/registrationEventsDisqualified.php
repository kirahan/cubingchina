<?php
$style = 'padding-top:13px;padding-left:39px;padding-right:13px;padding-bottom:13px;text-align:left;border-bottom:1px solid #ddd';
?>
<tr>
  <td style="<?php echo $style; ?>">
    <p><strong>亲爱的<?php echo $user->name_zh ?: $user->name; ?>：</strong></p>
    <p>
      您在<b><?php echo $competition->name_zh; ?></b>的报名如下项目因未达到资格线而被取消：<br>
      <?php echo $events['cn']; ?>。<br>
      详情请查看规则页：<a href="<?php echo $regulationUrl; ?>"><?php echo $regulationUrl; ?></a>。<br>
      <br>
      如有疑问，请联系下列比赛主办方，勿回复本邮件。<br>
      <?php foreach ($competition->organizer as $organizer): ?>
      <?php echo $organizer->user->name_zh; ?>：
      <?php echo $organizer->user->email; ?><br>
      <?php endforeach; ?>
    </p>
  </td>
<tr>
</tr>
  <td style="<?php echo $style; ?>">
    <p><strong>Dear <?php echo $user->name; ?>,</strong></p>
    <p>
      The following events of your registration for <b><?php echo $competition->name; ?></b> has been disqualified:<br>
      <?php echo $events['en']; ?>.<br>
      Here's the link of regulations: <a href="<?php echo $regulationUrl; ?>"><?php echo $regulationUrl; ?></a>.<br>
      <br>
      If you have any questions, please contact the organizer. Do not reply to this Email<br>
      <?php foreach ($competition->organizer as $organizer): ?>
      <?php echo $organizer->user->name; ?>:
      <?php echo $organizer->user->email; ?><br>
      <?php endforeach; ?>
    </p>
  </td>
</tr>
