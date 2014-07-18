<nav class="main-nav" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button><!--//nav-toggle-->
    </div><!--//navbar-header-->
    <div class="navbar-collapse collapse" id="navbar-collapse">
      <?php $this->widget('zii.widgets.CMenu', array(
        'encodeLabel'=>false,
        'htmlOptions'=>array(
          'class'=>'nav navbar-nav ' . $this->controller->id . ' ' . $this->controller->id . '-' . $this->controller->action->id,
        ),
        'submenuHtmlOptions'=>array(
          'class'=>'dropdown-menu',
        ),
        'items'=>$this->controller->navibar,
      ));?>
    </div><!--//navabr-collapse-->
  </div><!--//container-->
</nav><!--//main-nav-->