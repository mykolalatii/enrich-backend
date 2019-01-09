<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Dap User'), ['action' => 'add']) ?></li>
    </ul>
</nav>
<div class="dapUsers index large-9 medium-8 columns content">
    <h3><?= __('Dap Users') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th scope="col"><?= $this->Paginator->sort('id') ?></th>
                <th scope="col"><?= $this->Paginator->sort('first_name') ?></th>
                <th scope="col"><?= $this->Paginator->sort('last_name') ?></th>
                <th scope="col"><?= $this->Paginator->sort('user_name') ?></th>
                <th scope="col"><?= $this->Paginator->sort('email') ?></th>
                <th scope="col"><?= $this->Paginator->sort('password') ?></th>
                <th scope="col"><?= $this->Paginator->sort('address1') ?></th>
                <th scope="col"><?= $this->Paginator->sort('address2') ?></th>
                <th scope="col"><?= $this->Paginator->sort('city') ?></th>
                <th scope="col"><?= $this->Paginator->sort('state') ?></th>
                <th scope="col"><?= $this->Paginator->sort('zip') ?></th>
                <th scope="col"><?= $this->Paginator->sort('country') ?></th>
                <th scope="col"><?= $this->Paginator->sort('phone') ?></th>
                <th scope="col"><?= $this->Paginator->sort('fax') ?></th>
                <th scope="col"><?= $this->Paginator->sort('company') ?></th>
                <th scope="col"><?= $this->Paginator->sort('title') ?></th>
                <th scope="col"><?= $this->Paginator->sort('is_affiliate') ?></th>
                <th scope="col"><?= $this->Paginator->sort('last_login_date') ?></th>
                <th scope="col"><?= $this->Paginator->sort('activation_key') ?></th>
                <th scope="col"><?= $this->Paginator->sort('status') ?></th>
                <th scope="col"><?= $this->Paginator->sort('login_count') ?></th>
                <th scope="col"><?= $this->Paginator->sort('ipaddress') ?></th>
                <th scope="col"><?= $this->Paginator->sort('account_type') ?></th>
                <th scope="col"><?= $this->Paginator->sort('signup_date') ?></th>
                <th scope="col"><?= $this->Paginator->sort('paypal_email') ?></th>
                <th scope="col"><?= $this->Paginator->sort('last_update_date') ?></th>
                <th scope="col"><?= $this->Paginator->sort('aff_nick') ?></th>
                <th scope="col"><?= $this->Paginator->sort('opted_out') ?></th>
                <th scope="col"><?= $this->Paginator->sort('self_service_status') ?></th>
                <th scope="col"><?= $this->Paginator->sort('credits_available') ?></th>
                <th scope="col"><?= $this->Paginator->sort('exclude_iplogging') ?></th>
                <th scope="col" class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($dapUsers as $dapUser): ?>
            <tr>
                <td><?= $this->Number->format($dapUser->id) ?></td>
                <td><?= h($dapUser->first_name) ?></td>
                <td><?= h($dapUser->last_name) ?></td>
                <td><?= h($dapUser->user_name) ?></td>
                <td><?= h($dapUser->email) ?></td>
                <td><?= h($dapUser->password) ?></td>
                <td><?= h($dapUser->address1) ?></td>
                <td><?= h($dapUser->address2) ?></td>
                <td><?= h($dapUser->city) ?></td>
                <td><?= h($dapUser->state) ?></td>
                <td><?= h($dapUser->zip) ?></td>
                <td><?= h($dapUser->country) ?></td>
                <td><?= h($dapUser->phone) ?></td>
                <td><?= h($dapUser->fax) ?></td>
                <td><?= h($dapUser->company) ?></td>
                <td><?= h($dapUser->title) ?></td>
                <td><?= h($dapUser->is_affiliate) ?></td>
                <td><?= h($dapUser->last_login_date) ?></td>
                <td><?= h($dapUser->activation_key) ?></td>
                <td><?= h($dapUser->status) ?></td>
                <td><?= $this->Number->format($dapUser->login_count) ?></td>
                <td><?= h($dapUser->ipaddress) ?></td>
                <td><?= h($dapUser->account_type) ?></td>
                <td><?= h($dapUser->signup_date) ?></td>
                <td><?= h($dapUser->paypal_email) ?></td>
                <td><?= h($dapUser->last_update_date) ?></td>
                <td><?= h($dapUser->aff_nick) ?></td>
                <td><?= h($dapUser->opted_out) ?></td>
                <td><?= h($dapUser->self_service_status) ?></td>
                <td><?= $this->Number->format($dapUser->credits_available) ?></td>
                <td><?= h($dapUser->exclude_iplogging) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $dapUser->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $dapUser->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $dapUser->id], ['confirm' => __('Are you sure you want to delete # {0}?', $dapUser->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="paginator">
        <ul class="pagination">
            <?= $this->Paginator->prev('< ' . __('previous')) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next(__('next') . ' >') ?>
        </ul>
        <p><?= $this->Paginator->counter() ?></p>
    </div>
</div>
