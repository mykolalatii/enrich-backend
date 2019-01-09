<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * DapUser Entity
 *
 * @property int $id
 * @property string $first_name
 * @property string $last_name
 * @property string $user_name
 * @property string $email
 * @property string $password
 * @property string $address1
 * @property string $address2
 * @property string $city
 * @property string $state
 * @property string $zip
 * @property string $country
 * @property string $phone
 * @property string $fax
 * @property string $company
 * @property string $title
 * @property string $is_affiliate
 * @property \Cake\I18n\Time $last_login_date
 * @property string $activation_key
 * @property string $status
 * @property int $login_count
 * @property string $ipaddress
 * @property string $account_type
 * @property \Cake\I18n\Time $signup_date
 * @property string $paypal_email
 * @property \Cake\I18n\Time $last_update_date
 * @property string $aff_nick
 * @property string $opted_out
 * @property string $self_service_status
 * @property int $credits_available
 * @property string $exclude_iplogging
 */
class DapUser extends Entity
{

    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        '*' => true,
        'id' => false
    ];

    /**
     * Fields that are excluded from JSON versions of the entity.
     *
     * @var array
     */
    protected $_hidden = [
        'password'
    ];
}
