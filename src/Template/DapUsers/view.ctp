<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Dap User'), ['action' => 'edit', $dapUser->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Dap User'), ['action' => 'delete', $dapUser->id], ['confirm' => __('Are you sure you want to delete # {0}?', $dapUser->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Dap Users'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Dap User'), ['action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="dapUsers view large-9 medium-8 columns content">
    <h3><?= h($dapUser->title) ?></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row"><?= __('First Name') ?></th>
            <td><?= h($dapUser->first_name) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Last Name') ?></th>
            <td><?= h($dapUser->last_name) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('User Name') ?></th>
            <td><?= h($dapUser->user_name) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Email') ?></th>
            <td><?= h($dapUser->email) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Password') ?></th>
            <td><?= h($dapUser->password) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Address1') ?></th>
            <td><?= h($dapUser->address1) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Address2') ?></th>
            <td><?= h($dapUser->address2) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('City') ?></th>
            <td><?= h($dapUser->city) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('State') ?></th>
            <td><?= h($dapUser->state) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Zip') ?></th>
            <td><?= h($dapUser->zip) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Country') ?></th>
            <td><?= h($dapUser->country) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Phone') ?></th>
            <td><?= h($dapUser->phone) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Fax') ?></th>
            <td><?= h($dapUser->fax) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Company') ?></th>
            <td><?= h($dapUser->company) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Title') ?></th>
            <td><?= h($dapUser->title) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Is Affiliate') ?></th>
            <td><?= h($dapUser->is_affiliate) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Activation Key') ?></th>
            <td><?= h($dapUser->activation_key) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Status') ?></th>
            <td><?= h($dapUser->status) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Ipaddress') ?></th>
            <td><?= h($dapUser->ipaddress) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Account Type') ?></th>
            <td><?= h($dapUser->account_type) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Paypal Email') ?></th>
            <td><?= h($dapUser->paypal_email) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Aff Nick') ?></th>
            <td><?= h($dapUser->aff_nick) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Opted Out') ?></th>
            <td><?= h($dapUser->opted_out) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Self Service Status') ?></th>
            <td><?= h($dapUser->self_service_status) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Exclude Iplogging') ?></th>
            <td><?= h($dapUser->exclude_iplogging) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Id') ?></th>
            <td><?= $this->Number->format($dapUser->id) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Login Count') ?></th>
            <td><?= $this->Number->format($dapUser->login_count) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Credits Available') ?></th>
            <td><?= $this->Number->format($dapUser->credits_available) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Last Login Date') ?></th>
            <td><?= h($dapUser->last_login_date) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Signup Date') ?></th>
            <td><?= h($dapUser->signup_date) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Last Update Date') ?></th>
            <td><?= h($dapUser->last_update_date) ?></td>
        </tr>
    </table>
</div>
