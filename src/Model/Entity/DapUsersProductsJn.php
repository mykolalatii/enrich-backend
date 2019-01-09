<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * DapUsersProductsJn Entity
 *
 * @property int $user_id
 * @property int $product_id
 * @property \Cake\I18n\Time $access_start_date
 * @property \Cake\I18n\Time $access_end_date
 * @property int $transaction_id
 * @property int $coupon_id
 * @property string $status
 *
 * @property \App\Model\Entity\User $user
 * @property \App\Model\Entity\Product $product
 * @property \App\Model\Entity\Transaction $transaction
 * @property \App\Model\Entity\Coupon $coupon
 */
class DapUsersProductsJn extends Entity
{

}
