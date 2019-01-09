<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * DapUsers Controller
 *
 * @property \App\Model\Table\DapUsersTable $DapUsers
 */
class DapUsersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $dapUsers = $this->paginate($this->DapUsers);

        $this->set(compact('dapUsers'));
        $this->set('_serialize', ['dapUsers']);
    }

    /**
     * View method
     *
     * @param string|null $id Dap User id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $dapUser = $this->DapUsers->get($id, [
            'contain' => []
        ]);

        $this->set('dapUser', $dapUser);
        $this->set('_serialize', ['dapUser']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $dapUser = $this->DapUsers->newEntity();
        if ($this->request->is('post')) {
            $dapUser = $this->DapUsers->patchEntity($dapUser, $this->request->data);
            if ($this->DapUsers->save($dapUser)) {
                $this->Flash->success(__('The dap user has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The dap user could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('dapUser'));
        $this->set('_serialize', ['dapUser']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Dap User id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $dapUser = $this->DapUsers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $dapUser = $this->DapUsers->patchEntity($dapUser, $this->request->data);
            if ($this->DapUsers->save($dapUser)) {
                $this->Flash->success(__('The dap user has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The dap user could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('dapUser'));
        $this->set('_serialize', ['dapUser']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Dap User id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $dapUser = $this->DapUsers->get($id);
        if ($this->DapUsers->delete($dapUser)) {
            $this->Flash->success(__('The dap user has been deleted.'));
        } else {
            $this->Flash->error(__('The dap user could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

    public function getUserId() {
        $this->loadModel('DapUsersProductsJn');
        $this->loadModel('DapUsersCredits');
        if ($this->request->is('post')) {
            $userEmail = $this->request->data('email');
            $user = $this->DapUsers->find('all',array('DapUsers.email' => $userEmail))->first();
            if ($user) {
//                echo json_encode(array('status' => 200, 'data' => $user));
                $now = date("y-m-d");
                $products = $this->DapUsersProductsJn->find()->Where(
                    ['DapUsersProductsJn.user_id' => $user['id'],
                        'OR' => [['DapUsersProductsJn.product_id' => 74] ,
                            ['DapUsersProductsJn.product_id' => 75] ,
                            ['DapUsersProductsJn.product_id' => 76] ,
                            ['DapUsersProductsJn.product_id' => 77]]]
                )
                    ->andWhere(function($exp) use($now) {
                        $exp->lte('DapUsersProductsJn.access_start_date', $now);
                        $exp->gte('DapUsersProductsJn.access_end_date', $now);
                        return $exp;
                    });
            } else {
                echo json_encode(array('status' => 400, 'data' => 'No registered user'));
            }
        }

        /***
         * go to dap_users_product_jn controller to get product_id
        */


        exit;
    }
    public function getUserIdTest($userEmail = null) {
        $this->loadModel('DapUsersProductsJn');
            $user = $this->DapUsers->find('all',array('DapUsers.email' => $userEmail))->first();
            if ($user) {
                $now = date("y-m-d");
                echo json_encode(array('status' => 200, 'data' => $user));
                $products = $this->DapUsersProductsJn->find()->Where(
                    ['DapUsersProductsJn.user_id' => $user['id'],
                        'OR' => [['DapUsersProductsJn.product_id' => 74] ,
                            ['DapUsersProductsJn.product_id' => 75] ,
                            ['DapUsersProductsJn.product_id' => 76] ,
                            ['DapUsersProductsJn.product_id' => 77]]]
                    )
                ->andWhere(function($exp) use($now) {
                    $exp->lte('DapUsersProductsJn.access_start_date', $now);
                    $exp->gte('DapUsersProductsJn.access_end_date', $now);
                    return $exp;
                });
                echo json_encode($products);
            } else {
                echo json_encode(array('status' => 400, 'data' => 'No registered user'));
            }
        exit;
    }

}
