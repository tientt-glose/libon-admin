<?php

namespace Modules\Core\Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class CoreDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('groups')->insert(
            [
<<<<<<< HEAD
                'name' => 'admin',
=======
                'name' => 'user',
>>>>>>> feat: order make js validate
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]
        );
        DB::table('users')->insert(
            [
<<<<<<< HEAD
                'id_card' => '031731429',
                'fullname' => 'Nguyen Manh Tien',
                'email' =>  'admin@admin.com',
=======
                'id_card' => '031970067',
                'fullname' => 'Nguyen Manh Tien',
                'email' =>  'tiennguyenbka198@gmail.com',
>>>>>>> feat: order make js validate
                'password' =>  bcrypt('123456'),
                'phone' =>  '0945391533',
                'organization_id' => '1',
                'career' => '1',
<<<<<<< HEAD
                'id_staff_student' => '20164069',
                'referral_source' => '1',
                'admin' =>  '1',
=======
                'id_staff_student' => '20164068',
                'referral_source' => '1',
                'admin' =>  '0',
>>>>>>> feat: order make js validate
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]
        );

        DB::table('roles')->insert(
            [
<<<<<<< HEAD
                'name' => 'admin',
=======
                'name' => 'user',
>>>>>>> feat: order make js validate
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]
        );

        DB::table('group_user')->insert(
            [
<<<<<<< HEAD
                'user_id' => 1,
                'group_id' => 1,
=======
                'user_id' => 2,
                'group_id' => 2,
>>>>>>> feat: order make js validate
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]
        );

        DB::table('role_user')->insert(
            [
<<<<<<< HEAD
                'user_id' => 1,
                'role_id' => 1,
=======
                'user_id' => 2,
                'role_id' => 2,
>>>>>>> feat: order make js validate
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]
        );
    }
}
