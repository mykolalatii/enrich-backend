<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Dap Users'), ['action' => 'index']) ?></li>
    </ul>
</nav>
<div class="dapUsers form large-9 medium-8 columns content">
    <?= $this->Form->create($dapUser) ?>
    <fieldset>
        <legend><?= __('Add Dap User') ?></legend>
        <?php
            echo $this->Form->input('first_name');
            echo $this->Form->input('last_name');
            echo $this->Form->input('user_name');
            echo $this->Form->input('email');
            echo $this->Form->input('password');
            echo $this->Form->input('address1');
            echo $this->Form->input('address2');
            echo $this->Form->input('city');
            echo $this->Form->input('state');
            echo $this->Form->input('zip');
            echo $this->Form->input('country');
            echo $this->Form->input('phone');
            echo $this->Form->input('fax');
            echo $this->Form->input('company');
            echo $this->Form->input('title');
            echo $this->Form->input('is_affiliate');
            echo $this->Form->input('last_login_date', ['empty' => true]);
            echo $this->Form->input('activation_key');
            echo $this->Form->input('status');
            echo $this->Form->input('login_count');
            echo $this->Form->input('ipaddress');
            echo $this->Form->input('account_type');
            echo $this->Form->input('signup_date');
            echo $this->Form->input('paypal_email');
            echo $this->Form->input('last_update_date');
            echo $this->Form->input('aff_nick');
            echo $this->Form->input('opted_out');
            echo $this->Form->input('self_service_status');
            echo $this->Form->input('credits_available');
            echo $this->Form->input('exclude_iplogging');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
