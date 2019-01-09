<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * DapUsersCredits Controller
 *
 * @property \App\Model\Table\DapUsersCreditsTable $DapUsersCredits
 */
class DapUsersCreditsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['Users', 'Products', 'Resources', 'Transactions']
        ];
        $dapUsersCredits = $this->paginate($this->DapUsersCredits);

        $this->set(compact('dapUsersCredits'));
        $this->set('_serialize', ['dapUsersCredits']);
    }

    /**
     * View method
     *
     * @param string|null $id Dap Users Credit id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $dapUsersCredit = $this->DapUsersCredits->get($id, [
            'contain' => ['Users', 'Products', 'Resources', 'Transactions']
        ]);

        $this->set('dapUsersCredit', $dapUsersCredit);
        $this->set('_serialize', ['dapUsersCredit']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $dapUsersCredit = $this->DapUsersCredits->newEntity();
        if ($this->request->is('post')) {
            $dapUsersCredit = $this->DapUsersCredits->patchEntity($dapUsersCredit, $this->request->data);
            if ($this->DapUsersCredits->save($dapUsersCredit)) {
                $this->Flash->success(__('The dap users credit has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The dap users credit could not be saved. Please, try again.'));
            }
        }
        $users = $this->DapUsersCredits->Users->find('list', ['limit' => 200]);
        $products = $this->DapUsersCredits->Products->find('list', ['limit' => 200]);
        $resources = $this->DapUsersCredits->Resources->find('list', ['limit' => 200]);
        $transactions = $this->DapUsersCredits->Transactions->find('list', ['limit' => 200]);
        $this->set(compact('dapUsersCredit', 'users', 'products', 'resources', 'transactions'));
        $this->set('_serialize', ['dapUsersCredit']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Dap Users Credit id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $dapUsersCredit = $this->DapUsersCredits->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $dapUsersCredit = $this->DapUsersCredits->patchEntity($dapUsersCredit, $this->request->data);
            if ($this->DapUsersCredits->save($dapUsersCredit)) {
                $this->Flash->success(__('The dap users credit has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The dap users credit could not be saved. Please, try again.'));
            }
        }
        $users = $this->DapUsersCredits->Users->find('list', ['limit' => 200]);
        $products = $this->DapUsersCredits->Products->find('list', ['limit' => 200]);
        $resources = $this->DapUsersCredits->Resources->find('list', ['limit' => 200]);
        $transactions = $this->DapUsersCredits->Transactions->find('list', ['limit' => 200]);
        $this->set(compact('dapUsersCredit', 'users', 'products', 'resources', 'transactions'));
        $this->set('_serialize', ['dapUsersCredit']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Dap Users Credit id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $dapUsersCredit = $this->DapUsersCredits->get($id);
        if ($this->DapUsersCredits->delete($dapUsersCredit)) {
            $this->Flash->success(__('The dap users credit has been deleted.'));
        } else {
            $this->Flash->error(__('The dap users credit could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

    /**
     * Get credits using user's id
     */
    public function getCredits() {
        if ($this->request->is('post')) {
            $userId = $this->request->data('id');
            $credits = $this->DapUsersCredits->find()->where(['DapUsersCredits.user_id' => $userId]);
            echo json_encode(array('status' => 200, 'data' => $credits));
        } else {
            echo json_encode(array('status' => 200, 'data' => 'No credits'));
        }
        exit;
    }
    public function getCreditsTest($userId = null) {
        $credits = $this->DapUsersCredits->find()->where(['DapUsersCredits.user_id' => $userId]);
        echo json_encode(array('status' => 400, 'data' => $credits));
        exit;
    }

}
