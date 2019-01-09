<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * DapUsersProductsJn Model
 *
 * @property \Cake\ORM\Association\BelongsTo $Users
 * @property \Cake\ORM\Association\BelongsTo $Products
 * @property \Cake\ORM\Association\BelongsTo $Transactions
 * @property \Cake\ORM\Association\BelongsTo $Coupons
 *
 * @method \App\Model\Entity\DapUsersProductsJn get($primaryKey, $options = [])
 * @method \App\Model\Entity\DapUsersProductsJn newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\DapUsersProductsJn[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\DapUsersProductsJn|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\DapUsersProductsJn patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\DapUsersProductsJn[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\DapUsersProductsJn findOrCreate($search, callable $callback = null)
 */
class DapUsersProductsJnTable extends Table
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

        $this->table('dap_users_products_jn');

//        $this->belongsTo('Users', [
//            'foreignKey' => 'user_id',
//            'joinType' => 'INNER'
//        ]);
//        $this->belongsTo('Products', [
//            'foreignKey' => 'product_id',
//            'joinType' => 'INNER'
//        ]);
//        $this->belongsTo('Transactions', [
//            'foreignKey' => 'transaction_id'
//        ]);
//        $this->belongsTo('Coupons', [
//            'foreignKey' => 'coupon_id'
//        ]);
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
            ->date('access_start_date')
            ->requirePresence('access_start_date', 'create')
            ->notEmpty('access_start_date');

        $validator
            ->date('access_end_date')
            ->requirePresence('access_end_date', 'create')
            ->notEmpty('access_end_date');

        $validator
            ->requirePresence('status', 'create')
            ->notEmpty('status');

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
//        $rules->add($rules->existsIn(['user_id'], 'Users'));
//        $rules->add($rules->existsIn(['product_id'], 'Products'));
//        $rules->add($rules->existsIn(['transaction_id'], 'Transactions'));
//        $rules->add($rules->existsIn(['coupon_id'], 'Coupons'));

        return $rules;
    }
}
