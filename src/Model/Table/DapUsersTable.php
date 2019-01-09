<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * DapUsers Model
 *
 * @method \App\Model\Entity\DapUser get($primaryKey, $options = [])
 * @method \App\Model\Entity\DapUser newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\DapUser[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\DapUser|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\DapUser patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\DapUser[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\DapUser findOrCreate($search, callable $callback = null)
 */
class DapUsersTable extends Table
{

    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->table('dap_users');
        $this->displayField('title');
        $this->primaryKey('id');
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->integer('id')
            ->allowEmpty('id', 'create');

        $validator
            ->requirePresence('first_name', 'create')
            ->notEmpty('first_name');

        $validator
            ->allowEmpty('last_name');

        $validator
            ->allowEmpty('user_name')
            ->add('user_name', 'unique', ['rule' => 'validateUnique', 'provider' => 'table']);

        $validator
            ->email('email')
            ->requirePresence('email', 'create')
            ->notEmpty('email')
            ->add('email', 'unique', ['rule' => 'validateUnique', 'provider' => 'table']);

        $validator
            ->requirePresence('password', 'create')
            ->notEmpty('password');

        $validator
            ->allowEmpty('address1');

        $validator
            ->allowEmpty('address2');

        $validator
            ->allowEmpty('city');

        $validator
            ->allowEmpty('state');

        $validator
            ->allowEmpty('zip');

        $validator
            ->allowEmpty('country');

        $validator
            ->allowEmpty('phone');

        $validator
            ->allowEmpty('fax');

        $validator
            ->allowEmpty('company');

        $validator
            ->allowEmpty('title');

        $validator
            ->requirePresence('is_affiliate', 'create')
            ->notEmpty('is_affiliate');

        $validator
            ->date('last_login_date')
            ->allowEmpty('last_login_date');

        $validator
            ->allowEmpty('activation_key');

        $validator
            ->requirePresence('status', 'create')
            ->notEmpty('status');

        $validator
            ->integer('login_count')
            ->requirePresence('login_count', 'create')
            ->notEmpty('login_count');

        $validator
            ->allowEmpty('ipaddress');

        $validator
            ->requirePresence('account_type', 'create')
            ->notEmpty('account_type');

        $validator
            ->dateTime('signup_date')
            ->requirePresence('signup_date', 'create')
            ->notEmpty('signup_date');

        $validator
            ->allowEmpty('paypal_email');

        $validator
            ->date('last_update_date')
            ->requirePresence('last_update_date', 'create')
            ->notEmpty('last_update_date');

        $validator
            ->allowEmpty('aff_nick');

        $validator
            ->requirePresence('opted_out', 'create')
            ->notEmpty('opted_out');

        $validator
            ->requirePresence('self_service_status', 'create')
            ->notEmpty('self_service_status');

        $validator
            ->integer('credits_available')
            ->requirePresence('credits_available', 'create')
            ->notEmpty('credits_available');

        $validator
            ->requirePresence('exclude_iplogging', 'create')
            ->notEmpty('exclude_iplogging');

        return $validator;
    }

    /**
     * Returns a rules checker object that will be used for validating
     * application integrity.
     *
     * @param \Cake\ORM\RulesChecker $rules The rules object to be modified.
     * @return \Cake\ORM\RulesChecker
     */
    public function buildRules(RulesChecker $rules)
    {
        $rules->add($rules->isUnique(['email']));
        $rules->add($rules->isUnique(['user_name']));

        return $rules;
    }
}
