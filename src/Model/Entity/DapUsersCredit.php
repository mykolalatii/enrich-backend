<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * DapUsersCredit Entity
 *
 * @property int $user_id
 * @property int $product_id
 * @property int $resource_id
 * @property int $transaction_id
 * @property int $credits_earned
 * @property int $credits_spent
 * @property \Cake\I18n\Time $datetime
 * @property string $comments
 *
 * @property \App\Model\Entity\User $user
 * @property \App\Model\Entity\Product $product
 * @property \App\Model\Entity\Resource $resource
 * @property \App\Model\Entity\Transaction $transaction
 */
class DapUsersCredit extends Entity
{

}
