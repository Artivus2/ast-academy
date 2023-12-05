<?php

use yii\db\Migration;

/**
 * Class m231129_134800_events
 */
class m231129_134800_events extends Migration
{
    private string $events = 'events';
    private string $events_history = 'events_history';
    private string $organizators = 'organizators';
    private string $idxeventsHistoryEventsId = 'idx-events_history-events_id';
    private string $idxeventsHistoryOrganizatorsId = 'idx-events_history-organizators_id';
    private string $fkeventsHistoryEventsId = 'fk-events_history-events_id';
    private string $fkeventsHistoryOrganizatorsId = 'fk-events_history-organizators_id';
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable($this->events, [
            'id' => $this->primaryKey(),
            'title' => $this->string(255)->notNull(),
            'date' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),
            'description' => $this->string(255)
        ]);

        $this->createTable($this->events_history, [
            'id' => $this->primaryKey(),
            'events_id' =>  $this->integer(10)->notNull(),
            'organizators_id' => $this->integer(10)->notNull(),
        ]);

        $this->createTable($this->organizators, [
            'id' => $this->primaryKey(),
            'fio' => $this->string(255)->notNull(),
            'email' => $this->string(60)->notNull(),
            'phone' => $this->string(10)
        ]);

        $this->addForeignKey(
            $this->fkeventsHistoryEventsId,
            $this->events_history,
            'events_id',
            $this->events,
            'id',
            'CASCADE'
        );

        $this->addForeignKey(
            $this->fkeventsHistoryOrganizatorsId,
            $this->events_history,
            'organizators_id',
            $this->organizators,
            'id',
            'CASCADE'
        );

        // Создание индексов
        $this->createIndex(
            $this->idxeventsHistoryEventsId,
            $this->events_history,
            'events_id'
        );

        $this->createIndex(
            $this->idxeventsHistoryOrganizatorsId,
            $this->events_history,
            'organizators_id'
        );

            
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable($this->events);
        $this->dropTable($this->events_history);
        $this->dropTable($this->organizators);

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m231129_134800_events cannot be reverted.\n";

        return false;
    }
    */
}
